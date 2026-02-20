#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONF="${ROOT}/config/bootstrap.env"
[[ -f "$CONF" ]] && source "$CONF" || true
: "${SSH_PORT:=22}"
: "${UFW_ENABLE:=1}"
: "${FAIL2BAN_ENABLE:=1}"
export DEBIAN_FRONTEND=noninteractive

if [[ "$UFW_ENABLE" == "1" ]]; then
  apt-get install -y ufw
  ufw allow "${SSH_PORT}/tcp"
  ufw default deny incoming
  ufw default allow outgoing
  ufw --force enable
  ufw status verbose || true
  echo "✅ UFW activo (SSH ${SSH_PORT})."
fi

if [[ "$FAIL2BAN_ENABLE" == "1" ]]; then
  apt-get install -y fail2ban
  systemctl enable --now fail2ban
  echo "✅ Fail2ban activo."
fi
