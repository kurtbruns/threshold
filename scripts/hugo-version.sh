#!/usr/bin/env bash
# Print the canonical Hugo version pin from
# hugo.yaml module.hugoVersion.min.
#
# This is the single source of truth for the Hugo version. Note the value plays
# two roles: to Hugo it is a *floor* — Hugo refuses to build with anything older,
# so a local install (e.g. Homebrew's latest) may be newer. To CI it is the
# *exact* version installed for the deploy build, so the site always deploys with
# a known-good Hugo. Humans read it to know the minimum to install.
# Edit the pin in hugo.yaml, not here.
set -euo pipefail

repo_root="$(cd "$(dirname "$0")/.." && pwd)"
version="$(grep -oE 'min[[:space:]]*:[[:space:]]*"[0-9]+\.[0-9]+\.[0-9]+"' "$repo_root/hugo.yaml" \
  | head -1 | sed -E 's/.*"([0-9.]+)".*/\1/')"

if [ -z "$version" ]; then
  echo "hugo-version.sh: could not parse module.hugoVersion.min from hugo.yaml" >&2
  exit 1
fi

printf '%s\n' "$version"
