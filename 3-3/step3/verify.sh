#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'utilisation des quantificateurs précis {}
found '[A-Z]\{3\}-[0-9]\{5\}' || exit 1
found '(test-)\{2,\}' || exit 1

# Vérifie l'utilisation des groupes () et de l'alternative |
found '(ERROR|WARNING)' || exit 1

# Vérifie l'utilisation de l'échappement \.
found '192\\\.168\\\.1\\\.1' || exit 1

echo -n "done"