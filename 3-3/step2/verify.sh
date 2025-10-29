#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")

foundF() {
    local pattern="$1"
    for f in "${FILES[@]}"; do
        if [ -f "$f" ] && grep -Fq "$pattern" "$f"; then
            return 0
        fi
    done
    return 1
}

# 1. Vérifie la recherche avec la répétition manuelle des classes
foundF 'egrep "[A-Z][A-Z][A-Z]-[0-9][0-9][0-9][0-9][0-9]" data.txt' || exit 1

# 2. Vérifie l'utilisation de la négation pour ignorer les commentaires
foundF 'egrep "^[^#]" data.txt' || exit 1

# 3. Vérifie l'ancrage de début de ligne
foundF 'egrep "^START" data.txt' || exit 1

# 4. Vérifie l'ancrage de fin de ligne avec échappement
foundF 'egrep "transaction\.$" data.txt' || exit 1

# 5. Vérifie la correspondance exacte de ligne
foundF 'egrep "^OK$" data.txt' || exit 1

echo -n "done"