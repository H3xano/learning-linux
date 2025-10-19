#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'echo $PATH' || exit 1
found 'which ls' || exit 1
found './mon_script.sh' || exit 1

echo -n "done"