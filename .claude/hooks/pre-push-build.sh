#!/usr/bin/env bash
# Pre-push build gate. Wired in .claude/settings.json as a PreToolUse hook on the
# Bash tool. When the command is a `git push`, it builds the site first and
# BLOCKS the push if the build fails — so a broken site is never published.
#
# PreToolUse protocol: print a permissionDecision JSON to deny the call; exit 0
# with no output to let the normal permission flow proceed.
set -uo pipefail

input="$(cat)"

# Only gate `git push`; let every other Bash command through untouched.
case "$input" in
  *"git push"*) : ;;
  *) exit 0 ;;
esac

# Build in production mode to a throwaway directory.
out="$(mktemp -d 2>/dev/null || echo /tmp/threshold-prepush)"
if hugo --minify --destination "$out" >/dev/null 2>&1; then
  rm -rf "$out"
  exit 0
fi
rm -rf "$out"

cat <<'JSON'
{
  "hookSpecificOutput": {
    "hookEventName": "PreToolUse",
    "permissionDecision": "deny",
    "permissionDecisionReason": "The site does not build, so the push was blocked to avoid publishing a broken site. Run `hugo` to see the build error, fix it, then push again."
  }
}
JSON
exit 0
