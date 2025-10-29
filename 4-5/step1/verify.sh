#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -qF "$p" "$f" && return 0; done; return 1; }

found 'find ~ -name "secret_rapport.txt"' || exit 1
found 'find ~ -iname "rapport_final.pdf"' || exit 1
found 'find ~/archives -name "*.log"' || exit 1
found 'find ~/documents -name "rapport_?.pdf"' || exit 1

echo -n "done"