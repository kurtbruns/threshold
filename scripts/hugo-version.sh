#!/usr/bin/env bash
# Print the Hugo version pin (module.hugoVersion.min from hugo.yaml), the single
# source of truth read by CI and by anyone checking the minimum to install.
# The pin's floor-vs-exact meaning is documented in hugo.yaml; edit it there, not here.
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
version="$(grep -oE 'min[[:space:]]*:[[:space:]]*"[0-9]+\.[0-9]+\.[0-9]+"' "$repo_root/hugo.yaml" \
  | head -1 | sed -E 's/.*"([0-9.]+)".*/\1/')"

if [ -z "$version" ]; then
  echo "hugo-version.sh: could not parse module.hugoVersion.min from hugo.yaml" >&2
  exit 1
fi

printf '%s\n' "$version"
