#!/usr/bin/env bash
# Print the canonical Hugo version pin from
# config/_default/hugo.toml [module.hugoVersion] min.
#
# This is the single source of truth for the Hugo version: CI reads it to
# install a matching Hugo, and humans can read it to know which version to
# install. Edit the pin in hugo.toml, not here.
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
version="$(grep -oE 'min[[:space:]]*=[[:space:]]*"[0-9]+\.[0-9]+\.[0-9]+"' "$repo_root/config/_default/hugo.toml" \
  | head -1 | sed -E 's/.*"([0-9.]+)".*/\1/')"

if [ -z "$version" ]; then
  echo "hugo-version.sh: could not parse [module.hugoVersion] min from config/_default/hugo.toml" >&2
  exit 1
fi

printf '%s\n' "$version"
