#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'mkdir -p mon_projet' || exit 1
found 'touch mon_projet/README.md' || exit 1
found 'touch mon_projet/src/.gitignore' || exit 1

echo -n "done"