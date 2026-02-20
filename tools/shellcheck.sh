#!/usr/bin/env bash
set -euo pipefail
command -v shellcheck >/dev/null || { sudo apt-get update -y; sudo apt-get install -y shellcheck; }
shellcheck -x run.sh bootstrap/*.sh tools/*.sh
echo "✅ ShellCheck OK"
