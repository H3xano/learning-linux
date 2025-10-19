#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
# Fonction qui vérifie qu'une ligne de l'historique contient PLUSIEURS mots-clés
found() {
    for f in "${FILES[@]}"; do
        [ ! -f "$f" ] && continue
        # Commence par chercher les lignes contenant 'find'
        local find_lines=$(grep 'find' "$f" || true)
        [ -z "$find_lines" ] && continue

        # Vérifie que les autres mots-clés sont présents dans ces lignes
        local current_check="$find_lines"
        for arg in "$@"; do
            current_check=$(echo "$current_check" | grep "$arg" || true)
            [ -z "$current_check" ] && return 1 # Si un mot-clé manque, on échoue pour cette ligne
        done
        # Si on arrive ici avec current_check non-vide, c'est qu'on a trouvé une ligne avec tout
        [ -n "$current_check" ] && return 0
    done
    return 1
}

# Vérifie qu'une commande 'find' a été utilisée avec '-name' et 'secret_rapport.txt'
found '-name' 'secret_rapport.txt' || exit 1

# Vérifie qu'une commande 'find' a été utilisée avec '-iname' et 'rapport_final.pdf'
found '-iname' 'rapport_final.pdf' || exit 1

# Vérifie qu'une commande 'find' a été utilisée avec 'archives' et '*.log'
found 'archives' '\*\.log' || exit 1

echo -n "done"