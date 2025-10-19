#!/bin/bash
set -e

# Boilerplate standard pour trouver l'historique
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() {
    local pattern="$1"
    for f in "${FILES[@]}"; do
        if [ -f "$f" ] && grep -q "$pattern" "$f"; then
            return 0
        fi
    done
    return 1
}

# --- VÉRIFICATIONS SIMPLES ---

# 1. Vérifie si une commande contenant "find" et "secret_rapport.txt" a été exécutée.
#    C'est flexible et fonctionnera que l'utilisateur ait tapé ~ ou /home/learner.
found "find .* secret_rapport.txt" || exit 1

# 2. Vérifie si une commande "find" a été utilisée pour "rapport_final.pdf".
found "find .* rapport_final.pdf" || exit 1

# 3. Vérifie si une commande "find" a été utilisée pour les fichiers .log dans le dossier archives.
#    Le '\*' est important pour chercher le caractère '*' littéral.
found "find .* archives .* \*\.log" || exit 1


# Si toutes les vérifications passent
echo -n "done"