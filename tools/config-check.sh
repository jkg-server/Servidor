#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONF="${ROOT}/config/bootstrap.env"

if [[ -f "$CONF" ]]; then
  # shellcheck source=/dev/null
  source "$CONF"
fi

: "${SSH_PORT:=22}"
: "${UFW_ENABLE:=0}"
: "${FAIL2BAN_ENABLE:=1}"
: "${DOCKER_ENABLE:=1}"
: "${TAILSCALE_ENABLE:=0}"
: "${TS_EXTRA_ARGS:=}"

if [[ ! "$SSH_PORT" =~ ^[0-9]+$ ]] || ((SSH_PORT < 1 || SSH_PORT > 65535)); then
  printf 'ERROR: SSH_PORT debe estar entre 1 y 65535.\n' >&2
  exit 1
fi

for flag_name in UFW_ENABLE FAIL2BAN_ENABLE DOCKER_ENABLE TAILSCALE_ENABLE; do
  flag_value="${!flag_name}"
  if [[ "$flag_value" != "0" && "$flag_value" != "1" ]]; then
    printf 'ERROR: %s debe valer 0 o 1.\n' "$flag_name" >&2
    exit 1
  fi
done

if [[ "$TS_EXTRA_ARGS" == *$'\n'* || "$TS_EXTRA_ARGS" == *$'\r'* ]]; then
  printf 'ERROR: TS_EXTRA_ARGS no puede contener saltos de línea.\n' >&2
  exit 1
fi

printf 'OK: configuración válida; no se muestran valores sensibles.\n'
