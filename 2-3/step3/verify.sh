#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Check if the sudoers file was created and contains the correct rule.
grep -q "NOPASSWD: /usr/bin/apt update" /etc/sudoers.d/learner-privileges || exit 1

# Check if the user tested the command.
found 'sudo apt update' || exit 1

echo -n "done"