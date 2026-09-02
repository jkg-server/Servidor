#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

mapfile -d '' scripts < <(find . -type f -name '*.sh' -not -path './.git/*' -print0 | sort -z)
for script in "${scripts[@]}"; do
  bash -n "$script"
done
printf 'OK: sintaxis Bash.\n'

if command -v shellcheck >/dev/null 2>&1; then
  shellcheck -x "${scripts[@]}"
  printf 'OK: ShellCheck.\n'
else
  printf 'INFO: ShellCheck no instalado; CI ejecutará la comprobación.\n'
fi

bash tools/config-check.sh
bash tools/repo-policy.sh
printf 'VALIDATION=PASS\n'
