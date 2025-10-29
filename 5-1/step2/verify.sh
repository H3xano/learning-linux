#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'apropos copy' || exit 1
found 'whatis cp' || exit 1
found 'whatis ls' || exit 1
found 'apropos "space usage"' || exit 1

echo -n "done"