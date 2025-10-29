#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -E -q "$p" "$f" && return 0; done; return 1; }

found 'mkdir ~/bin' || exit 1
found 'mv ~/mon_script.sh ~/bin/' || exit 1
found 'export PATH=~/bin:\$PATH' || exit 1
found '^mon_script.sh$' || exit 1

echo -n "done"