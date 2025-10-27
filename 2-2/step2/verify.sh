#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qE "$p" "$f" && return 0; done; return 1; }
found 'ls \*.txt' || exit 1
found 'ls rapport_0.\.txt' || exit 1
found 'ls photo\[AB\]\.jpg' || exit 1
found 'mkdir.*\{.*,.*\}' || exit 1
echo -n "done"