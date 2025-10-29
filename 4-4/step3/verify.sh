#!/bin/bash
set -e
FILES=("$HOME/.bash_history" "/home/learner/.bash_history")
found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie la commande de renommage
found 'mv mon_projet_backup/NOTES.md mon_projet_backup/OLD_NOTES.md' || exit 1

# Vérifie la commande de déplacement du répertoire avec -v
found 'mv -v' || exit 1

# Vérifie que l'option -i a bien été utilisée pour le déplacement conflictuel
found 'mv -i' || exit 1

echo -n "done"