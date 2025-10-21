#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie que les commandes ont été tapées
found 'sudo chmod u+s suid_script.sh' || found 'sudo chmod 4755 suid_script.sh' || exit 1
found './suid_script.sh' || exit 1

# Vérifie que le script a bien été exécuté en tant que root
if ! [[ $(./suid_script.sh) == "root" ]]; then
  exit 1
fi

echo -n "done"