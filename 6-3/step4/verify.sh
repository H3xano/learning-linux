#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'activation du SGID
found 'chmod g\+s shared_folder' || exit 1

# Vérifie la création du fichier pour tester l'héritage
found 'touch shared_folder/rapport_equipe.txt' || exit 1

# Vérifie l'activation du Sticky Bit
found 'chmod 1777 public_space' || exit 1

# Vérifie la combinaison finale
found 'chmod 3770 shared_folder' || exit 1

echo -n "done"