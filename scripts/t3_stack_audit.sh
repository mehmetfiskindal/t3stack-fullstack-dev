#!/usr/bin/env bash
set -euo pipefail

root="${1:-.}"

if [[ ! -f "$root/package.json" ]]; then
  echo "[FAIL] package.json not found at: $root"
  exit 1
fi

checks=(
  '"next"'
  '"typescript"'
  '"@trpc/server"'
  '"@prisma/client"'
  '"better-auth"'
  '"tailwindcss"'
)

echo "[INFO] Auditing T3 stack dependencies in $root/package.json"
missing=0
for dep in "${checks[@]}"; do
  if ! rg -q "$dep" "$root/package.json"; then
    echo "[WARN] Missing dependency marker: $dep"
    missing=1
  else
    echo "[OK] Found: $dep"
  fi
done

if [[ -f "$root/prisma/schema.prisma" ]]; then
  echo "[OK] Found prisma/schema.prisma"
else
  echo "[WARN] Missing prisma/schema.prisma"
  missing=1
fi

if [[ $missing -eq 0 ]]; then
  echo "[PASS] Core T3 stack markers detected"
else
  echo "[FAIL] One or more core markers missing"
  exit 2
fi
