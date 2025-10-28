#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation des classes de caractères []
found '\[A-Z\]\[A-Z\]\[A-Z\]' || exit 1

# Vérifie l'utilisation de la négation [^...]
found '\[\^#\]' || exit 1

# Vérifie l'utilisation de l'ancrage ^ et $
found '\^START' || exit 1
found 'transaction\\\.\$' || exit 1
found '\^OK\$' || exit 1

echo -n "done"