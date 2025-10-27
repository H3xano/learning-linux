#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qE "$p" "$f" && return 0; done; return 1; }
found 'ls -l /etc' || exit 1
found 'ls -lah' || exit 1
found 'ls --help' || exit 1
found 'man ls' || exit 1
echo -n "done"