#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'ls -lah' || exit 1
found 'ls -ltr' || exit 1
found 'ls -lhS' || exit 1
found 'ls -F' || exit 1

echo -n "done"