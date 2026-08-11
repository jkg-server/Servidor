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
export DEBIAN_FRONTEND=noninteractive

if [[ "$UFW_ENABLE" == "1" ]]; then
  apt-get install -y --no-install-recommends ufw

  active_ssh_port=""
  if command -v sshd >/dev/null 2>&1; then
    active_ssh_port="$(sshd -T 2>/dev/null | awk '$1 == "port" {print $2; exit}')"
  fi

  if [[ "$active_ssh_port" =~ ^[0-9]+$ ]]; then
    ufw allow "${active_ssh_port}/tcp"
  fi
  ufw allow "${SSH_PORT}/tcp"
  ufw default deny incoming
  ufw default allow outgoing
  ufw --force enable
  ufw status verbose
  printf 'OK: UFW activo; puerto SSH configurado: %s.\n' "$SSH_PORT"
else
  printf 'INFO: UFW desactivado en la configuración.\n'
fi

if [[ "$FAIL2BAN_ENABLE" == "1" ]]; then
  apt-get install -y --no-install-recommends fail2ban
  systemctl enable --now fail2ban
  printf 'OK: Fail2ban activo.\n'
else
  printf 'INFO: Fail2ban desactivado en la configuración.\n'
fi
