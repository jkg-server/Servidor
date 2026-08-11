#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONF="${ROOT}/config/bootstrap.env"

if [[ -f "$CONF" ]]; then
  # shellcheck source=/dev/null
  source "$CONF"
fi

: "${DOCKER_ENABLE:=1}"

if [[ "$DOCKER_ENABLE" != "1" ]]; then
  printf 'INFO: Docker desactivado en la configuración.\n'
  exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
  printf 'ERROR: falta curl; ejecuta primero el paso init.\n' >&2
  exit 1
fi

installer="$(mktemp /tmp/docker-install.XXXXXX.sh)"
trap 'rm -f -- "$installer"' EXIT
curl --fail --silent --show-error --location https://get.docker.com --output "$installer"
sh "$installer"

systemctl enable --now docker
docker --version
docker compose version
printf 'OK: Docker y Docker Compose disponibles.\n'
