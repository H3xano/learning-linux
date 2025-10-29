#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")

# Utilise grep -F pour chercher des chaînes littérales, ce qui est plus sûr.
foundF() {
    local pattern="$1"
    for f in "${FILES[@]}"; do
        if [ -f "$f" ] && grep -Fq "$pattern" "$f"; then
            return 0
        fi
    done
    return 1
}

# 1. Vérifie l'utilisation de `egrep` avec le quantificateur `?`
foundF 'egrep "colou?r" data.txt' || exit 1

# 2. Vérifie l'utilisation de `egrep` avec le quantificateur `+`
foundF 'egrep "user_[a-z]+" data.txt' || exit 1

# 3. Vérifie l'utilisation de `egrep` avec `.*` et l'option -i
foundF 'egrep -i "start.*end" data.txt' || exit 1

echo -n "done"