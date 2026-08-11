#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
LOG_DIR="${ROOT}/logs"
TS="$(date +%F_%H%M%S)"
LOG_FILE="${LOG_DIR}/bootstrap_${TS}.log"

mkdir -p "$LOG_DIR"

on_error() {
  local line="$1"
  printf 'ERROR: fallo en la línea %s. Registro: %s\n' "$line" "$LOG_FILE" >&2
}
trap 'on_error "$LINENO"' ERR

banner() {
  printf '\n============================================================\n%s\n============================================================\n' "$1"
}

require_root() {
  if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
    printf 'ERROR: ejecuta esta operación con sudo.\n' >&2
    exit 1
  fi
}

step() {
  local name="$1"
  require_root
  bash "${ROOT}/tools/config-check.sh"

  case "$name" in
    init)
      banner "Paso init"
      bash "${ROOT}/bootstrap/00-init.sh"
      ;;
    security)
      banner "Paso security"
      bash "${ROOT}/bootstrap/10-security.sh"
      ;;
    docker)
      banner "Paso docker"
      bash "${ROOT}/bootstrap/20-docker.sh"
      ;;
    tailscale)
      banner "Paso tailscale"
      bash "${ROOT}/bootstrap/30-tailscale.sh"
      ;;
    *)
      printf 'ERROR: paso no válido: %s\n' "$name" >&2
      exit 1
      ;;
  esac
}

check_host() {
  banner "Comprobación rápida"
  systemctl is-active fail2ban 2>/dev/null || true
  systemctl is-active docker 2>/dev/null || true
  ufw status verbose 2>/dev/null || true
  docker --version 2>/dev/null || true
  docker compose version 2>/dev/null || true
  tailscale status 2>/dev/null || true
}

usage() {
  cat <<'EOF'
Uso:
  sudo ./run.sh bootstrap
  sudo ./run.sh step <init|security|docker|tailscale>
  ./run.sh check
EOF
}

case "${1:-}" in
  bootstrap)
    require_root
    exec > >(tee -a "$LOG_FILE") 2>&1
    bash "${ROOT}/tools/config-check.sh"
    banner "Servidor · bootstrap completo"
    step init
    step security
    step docker
    step tailscale
    banner "Bootstrap finalizado"
    printf 'Registro: %s\n' "$LOG_FILE"
    ;;
  step)
    exec > >(tee -a "$LOG_FILE") 2>&1
    step "${2:?Uso: sudo ./run.sh step <init|security|docker|tailscale>}"
    printf 'Registro: %s\n' "$LOG_FILE"
    ;;
  check)
    check_host
    ;;
  *)
    usage
    exit 1
    ;;
esac
