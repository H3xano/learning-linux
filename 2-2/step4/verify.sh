#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qE "$p" "$f" && return 0; done; return 1; }
found 'mkdir backup \&\& cp' || exit 1
found 'mkdir backup \|\| echo' || exit 1
found 'date ; whoami ; hostname' || exit 1
echo -n "done"