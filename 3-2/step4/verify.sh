#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { pat="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -Eq "$pat" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation de --color
found 'grep .*--color' || exit 1
# Vérifie l'utilisation de -C
found 'grep .*-C' || exit 1
# Vérifie l'utilisation de -B
found 'grep .*-B' || exit 1

echo -n "done"