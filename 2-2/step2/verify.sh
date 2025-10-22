#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }
# On cherche des motifs plus simples et plus fiables
found 'ls \*.txt' || exit 1
found 'ls photo\*' || exit 1
found 'ls rapport_0.\.txt' || exit 1 # On cherche un point littéral au lieu de '?'
found 'ls photo\[A-B\]\.jpg' || found 'ls photo\[AB\]\.jpg' || exit 1
echo -n "done"