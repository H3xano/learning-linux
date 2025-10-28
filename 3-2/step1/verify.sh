#!/bin/bash
set -e

FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local pattern="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$pattern" "$f" && return 0; done; return 1; }

# Vérifie que 'grep "Paris"' a été utilisé
found 'grep "Paris"' || exit 1
# Vérifie que 'ps' a été pipé dans 'grep'
found 'ps .*|.* grep' || exit 1
# Vérifie que l'astuce 'grep -v "grep"' a été utilisée
found 'grep -v .*grep' || exit 1

echo -n "done"