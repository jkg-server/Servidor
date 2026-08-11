#!/usr/bin/env bash
set -Eeuo pipefail

export DEBIAN_FRONTEND=noninteractive

if ! command -v apt-get >/dev/null 2>&1; then
  printf 'ERROR: este bootstrap requiere una distribución basada en APT.\n' >&2
  exit 1
fi

apt-get update -y
apt-get install -y --no-install-recommends \
  ca-certificates curl git gnupg htop jq lsb-release nano tmux unzip vim zip

printf 'OK: paquetes base instalados.\n'
