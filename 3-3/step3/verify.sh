#!/bin/bash
set -e

# Chemin vers les fichiers d'historique possibles
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")

# Fonction très simple pour chercher une chaîne de caractères dans l'historique
found() {
    local pattern="$1"
    for f in "${FILES[@]}"; do
        if [ -f "$f" ] && grep -q "$pattern" "$f"; then
            return 0 # Trouvé !
        fi
    done
    return 1 # Non trouvé
}

# 1. Vérifie si l'utilisateur a utilisé les quantificateurs précis {}.
# On cherche simplement la présence du caractère '{' dans l'historique.
found '{' || exit 1

# 2. Vérifie si l'utilisateur a utilisé les groupes ().
# On cherche simplement la présence du caractère '('.
found '(' || exit 1

# 3. Vérifie si l'utilisateur a utilisé l'échappement \.
# Pour chercher un '\', il faut l'échapper pour le grep du script : '\\'.
found '\\' || exit 1

echo -n "done"