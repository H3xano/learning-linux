#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'which python3' || exit 1
found 'ls /var/log' || exit 1
found 'ls /var/cache/apt' || exit 1
found 'ls /opt' || exit 1
found 'ls /srv' || exit 1

echo -n "done"