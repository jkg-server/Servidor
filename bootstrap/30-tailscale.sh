#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONF="${ROOT}/config/bootstrap.env"

if [[ -f "$CONF" ]]; then
  # shellcheck source=/dev/null
  source "$CONF"
fi

: "${TAILSCALE_ENABLE:=0}"
: "${TS_AUTHKEY:=}"
: "${TS_EXTRA_ARGS:=}"

if [[ "$TAILSCALE_ENABLE" != "1" ]]; then
  printf 'INFO: Tailscale desactivado en la configuración.\n'
  exit 0
fi

if ! command -v curl >/dev/null 2>&1; then
  printf 'ERROR: falta curl; ejecuta primero el paso init.\n' >&2
  exit 1
fi

installer="$(mktemp /tmp/tailscale-install.XXXXXX.sh)"
trap 'rm -f -- "$installer"' EXIT
curl --fail --silent --show-error --location https://tailscale.com/install.sh --output "$installer"
sh "$installer"
systemctl enable --now tailscaled

declare -a up_args=()
if [[ -n "$TS_AUTHKEY" ]]; then
  up_args+=("--auth-key=${TS_AUTHKEY}")
fi
if [[ -n "$TS_EXTRA_ARGS" ]]; then
  read -r -a extra_args <<< "$TS_EXTRA_ARGS"
  up_args+=("${extra_args[@]}")
fi

if ((${#up_args[@]} > 0)); then
  tailscale up "${up_args[@]}"
  printf 'OK: Tailscale configurado.\n'
else
  printf 'INFO: Tailscale instalado. Completa el acceso con: sudo tailscale up\n'
fi
