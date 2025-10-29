#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qF "$p" "$f" && return 0; done; return 1; }

found 'find ~/temporaire -name "*.tmp" -delete' || exit 1
found 'ls ~/temporaire' || exit 1
found 'find ~/archives -name "vieux_log.log" -exec gzip {} \;' || exit 1
found 'ls ~/archives' || exit 1

echo -n "done"