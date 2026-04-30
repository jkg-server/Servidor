#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF="${ROOT}/config/bootstrap.env"
LOG_DIR="${ROOT}/logs"
TS="$(date +%F_%H%M%S)"
LOG_FILE="${LOG_DIR}/bootstrap_${TS}.log"

mkdir -p "$LOG_DIR"
exec > >(tee -a "$LOG_FILE") 2>&1

on_error() {
  local line="$1"
  echo "ERROR: fallo en línea ${line}. Revisa: ${LOG_FILE}" >&2
}
trap 'on_error $LINENO' ERR

if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  echo "ERROR: ejecuta con sudo: sudo $0 $*" >&2
  exit 1
fi

if [[ -f "$CONF" ]]; then
  # shellcheck disable=SC1090
  source "$CONF"
else
  echo "INFO: no existe config/bootstrap.env. Uso valores por defecto."
fi

: "${SSH_PORT:=22}"
: "${UFW_ENABLE:=1}"
: "${FAIL2BAN_ENABLE:=1}"
: "${DOCKER_ENABLE:=1}"
: "${TAILSCALE_ENABLE:=0}"
: "${TS_AUTHKEY:=}"
: "${TS_EXTRA_ARGS:=}"

banner() {
  echo
  echo "============================================================"
  echo "$1"
  echo "============================================================"
}

step() {
  case "$1" in
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
      echo "Paso inválido: $1" >&2
      exit 1
      ;;
  esac
}

usage() {
  cat <<'EOF'
Uso:
  sudo ./run.sh bootstrap
  sudo ./run.sh step <init|security|docker|tailscale>
  sudo ./run.sh check
EOF
}

case "${1:-}" in
  bootstrap)
    banner "Servidor · bootstrap completo"
    step init
    step security
    step docker
    step tailscale
    banner "Bootstrap finalizado"
    ;;
  step)
    step "${2:?Uso: sudo ./run.sh step <init|security|docker|tailscale>}"
    ;;
  check)
    banner "Comprobación rápida"
    systemctl status fail2ban --no-pager || true
    systemctl status docker --no-pager || true
    ufw status verbose || true
    docker --version || true
    docker compose version || true
    tailscale status || true
    ;;
  *)
    usage
    exit 1
    ;;
esac

echo "Log: $LOG_FILE"
