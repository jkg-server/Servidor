#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONF="${ROOT}/config/bootstrap.env"
[[ -f "$CONF" ]] && source "$CONF" || true
: "${DOCKER_ENABLE:=1}"

[[ "$DOCKER_ENABLE" == "1" ]] || { echo "ℹ️ Docker desactivado."; exit 0; }

# Instalación estándar rápida (puedes cambiar a repo oficial si quieres más control)
curl -fsSL https://get.docker.com | sh
systemctl enable --now docker
docker --version || true
docker compose version || true
echo "✅ Docker listo."
