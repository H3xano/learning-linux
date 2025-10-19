#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'ls /home' || exit 1
found 'ls ~' || exit 1
found 'touch /tmp/mon_fichier_test.txt' || exit 1

echo -n "done"