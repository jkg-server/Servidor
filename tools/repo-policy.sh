#!/usr/bin/env bash
set -Eeuo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT"

status=0

forbidden_paths='(^|/)(deploy|backups?|secrets?|evidencias?)(/|$)|\.(sql|dump|b64|tar|tgz|zip|7z|bak)(\.gz)?$|(^|/)config/.*\.env$'
if git ls-files | grep -E "$forbidden_paths"; then
  printf 'ERROR: hay rutas o formatos prohibidos en el repositorio público.\n' >&2
  status=1
fi

while IFS= read -r tracked_file; do
  [[ -f "$tracked_file" ]] || continue
  file_size="$(wc -c < "$tracked_file")"
  if ((file_size > 1048576)); then
    printf 'ERROR: archivo rastreado mayor de 1 MiB: %s\n' "$tracked_file" >&2
    status=1
  fi
done < <(git ls-files)

network_pattern='(^|[^0-9])(10\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}|192\.168\.[0-9]{1,3}\.[0-9]{1,3}|172\.(1[6-9]|2[0-9]|3[01])\.[0-9]{1,3}\.[0-9]{1,3}|100\.(6[4-9]|[7-9][0-9]|1[01][0-9]|12[0-7])\.[0-9]{1,3}\.[0-9]{1,3})([^0-9]|$)'
if git grep -nE "$network_pattern" -- . ':(exclude)tools/repo-policy.sh'; then
  printf 'ERROR: se detectaron direcciones privadas o CGNAT/Tailscale. Usa marcadores genéricos.\n' >&2
  status=1
fi

if ((status != 0)); then
  exit "$status"
fi

printf 'OK: frontera del repositorio público.\n'
