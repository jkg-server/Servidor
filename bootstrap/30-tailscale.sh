#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONF="${ROOT}/config/bootstrap.env"
[[ -f "$CONF" ]] && source "$CONF" || true
: "${TAILSCALE_ENABLE:=0}"
: "${TS_AUTHKEY:=}"

[[ "$TAILSCALE_ENABLE" == "1" ]] || { echo "ℹ️ Tailscale desactivado."; exit 0; }

curl -fsSL https://tailscale.com/install.sh | sh
systemctl enable --now tailscaled
if [[ -n "$TS_AUTHKEY" ]]; then
  tailscale up --authkey="$TS_AUTHKEY" || true
else
  echo "Login manual: sudo tailscale up"
fi
