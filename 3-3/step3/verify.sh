#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation des quantificateurs précis {}
found 'grep -E ".*\{.*"' || found 'egrep ".*\{.*"' || exit 1

# Vérifie l'utilisation des groupes ()
found 'grep -E ".*\(.*"' || found 'egrep ".*\(.*"' || exit 1

echo -n "done"