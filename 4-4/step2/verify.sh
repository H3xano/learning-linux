#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'cp -r mon_projet/ mon_projet_copie/' || exit 1
found 'cp -i' || exit 1

echo -n "done"