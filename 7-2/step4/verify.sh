#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
found 'df -h' || exit 1
found 'df -i' || exit 1
found 'sudo du -h --max-depth=1 /var' || exit 1
echo -n "done"