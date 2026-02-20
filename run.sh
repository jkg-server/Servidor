#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONF="${ROOT}/config/bootstrap.env"

[[ -f "$CONF" ]] && source "$CONF" || true
: "${SSH_PORT:=22}"
: "${UFW_ENABLE:=1}"
: "${FAIL2BAN_ENABLE:=1}"
: "${DOCKER_ENABLE:=1}"
: "${TAILSCALE_ENABLE:=0}"
: "${TS_AUTHKEY:=}"

if [[ "${EUID:-$(id -u)}" -ne 0 ]]; then
  echo "ERROR: Ejecuta con sudo: sudo $0 $*" >&2
  exit 1
fi

step() {
  case "$1" in
    init)      bash "${ROOT}/bootstrap/00-init.sh" ;;
    security)  bash "${ROOT}/bootstrap/10-security.sh" ;;
    docker)    bash "${ROOT}/bootstrap/20-docker.sh" ;;
    tailscale) bash "${ROOT}/bootstrap/30-tailscale.sh" ;;
    *) echo "Paso inválido: $1" >&2; exit 1 ;;
  esac
}

case "${1:-}" in
  bootstrap) step init; step security; step docker; step tailscale; echo "✅ Bootstrap finalizado." ;;
  step)     step "${2:?Uso: sudo ./run.sh step <init|security|docker|tailscale>}" ;;
  *) echo "Uso: sudo ./run.sh bootstrap | sudo ./run.sh step <init|security|docker|tailscale>"; exit 1 ;;
esac
