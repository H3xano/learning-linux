#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'ln -s' || exit 1
found 'ln data.txt' || exit 1
found 'ls -i data.txt data_alias.txt' || exit 1
found 'ls -i original.txt raccourci.txt' || exit 1

echo -n "done"