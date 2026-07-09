#!/usr/bin/env bash
# Wrapper so `hugo server` honors the PORT env var. Claude Code's launch.json
# autoPort sets $PORT when it relocates off a busy 1313, but Hugo only takes
# --port, so the indirection lives here. Falls back to 1313 for a plain run.
#
# `exec` replaces this shell with hugo so Ctrl-C and stop signals reach hugo
# directly instead of an intermediate bash, leaving no orphaned server on the port.
#
# --renderToMemory: `hugo server` writes to disk by default; rendering to memory
# keeps multiple preview instances isolated and skips churning files on disk.
# --buildDrafts: show in-progress (draft) pages while previewing locally.
set -eu
exec hugo server --renderToMemory --buildDrafts --port "${PORT:-1313}" "$@"
