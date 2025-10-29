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

# 1. Vérifie l'utilisation des quantificateurs précis {}
foundF 'egrep "[A-Z]{3}-[0-9]{5}" data.txt' || exit 1

# 2. Vérifie l'utilisation d'un quantificateur d'intervalle {n,} avec un groupe
foundF 'egrep "(test-){2,}" data.txt' || exit 1

# 3. Vérifie l'utilisation de l'alternative |
foundF 'egrep "(ERROR|WARNING)" data.txt' || exit 1

# 4. Vérifie l'échappement pour une recherche littérale d'IP
foundF 'egrep "192\.168\.1\.1" data.txt' || exit 1

echo -n "done"