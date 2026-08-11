#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! command -v shellcheck >/dev/null 2>&1; then
  printf 'ERROR: ShellCheck no está instalado.\n' >&2
  exit 1
fi

mapfile -d '' scripts < <(find "$ROOT" -type f -name '*.sh' -not -path '*/.git/*' -print0 | sort -z)
shellcheck -x "${scripts[@]}"
printf 'OK: ShellCheck.\n'
