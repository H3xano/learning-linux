#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qF "$p" "$f" && return 0; done; return 1; }

found 'find ~ -size +40k' || exit 1
found 'find ~ -mtime -1' || exit 1
found 'find ~ -type f -perm 666' || exit 1
found 'find ~ -size +1k -mtime -1' || exit 1

echo -n "done"