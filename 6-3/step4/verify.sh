#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

found 'chmod 2775 shared_folder/' || exit 1
found 'touch shared_folder/mon_fichier_partage.txt' || exit 1
found 'chmod 1777 public_space/' || exit 1

# Vérifie que le nouveau fichier a bien hérité du bon groupe
GROUP=$(stat -c '%G' shared_folder/mon_fichier_partage.txt)
if [[ "$GROUP" != "equipe" ]]; then
  exit 1
fi

echo -n "done"