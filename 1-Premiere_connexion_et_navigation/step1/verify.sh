#!/bin/bash

# for Validator to verify as success, the script needs to exit with code 0 (no error)
# and HAS to ONLY output "done". Every other text output will be taken as error.

# NOTE: there seems to be a limit after which the Validator verify command is not valid, even
# though exit code 0 and "done" is returned. This could be after X amount of commands, or too
# long execution time, not sure why. Hence this file should be as short as possible.

set -e

# Pick likely history files (current user, learner, root)
H1=$(eval echo "${HISTFILE:-$HOME/.bash_history}")
FILES=("$H1" "/home/learner/.bash_history" "/root/.bash_history")

check() {
  local pat="$1"
  shift
  for f in "$@"; do
    [ -f "$f" ] || continue
    if grep -Eq "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

# Robust patterns (avoid matching substrings)
P_WHOAMI='(^|[[:space:];|&])whoami([[:space:];|&]|$)'
P_ID='(^|[[:space:];|&])id([[:space:];|&]|$)'
P_GROUPS='(^|[[:space:];|&])groups([[:space:];|&]|$)'

check "$P_WHOAMI" "${FILES[@]}" || exit 1
check "$P_ID"     "${FILES[@]}" || exit 1
check "$P_GROUPS" "${FILES[@]}" || exit 1

echo -n "done"
