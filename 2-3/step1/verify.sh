#!/bin/bash
set -e

# --- CORRECTION : On ajoute l'historique de root à la liste des fichiers à vérifier ---
FILES=("$HOME/.bash_history" "/home/learner/.bash_history" "/root/.bash_history")

found() {
  local pat="$1"
  for f in "${FILES[@]}"; do
    # On vérifie qu'on a le droit de lire le fichier avant de lancer grep
    if [ -f "$f" ] && [ -r "$f" ]; then
      if grep -Eq "$pat" "$f"; then
        return 0 # Trouvé !
      fi
    fi
  done
  return 1 # Non trouvé
}

# On vérifie que les commandes de base ont été lancées (par learner)
found '^su$' || exit 1
found '^su -$' || exit 1

# On vérifie qu'une commande clé a été exécutée en tant que root
# Cette commande se trouvera dans /root/.bash_history
found 'cat /etc/shadow' || exit 1

# On s'assure que l'utilisateur est bien revenu à son état initial
if [[ $(whoami) != "learner" ]]; then
  exit 1
fi

echo -n "done"