#!/bin/bash
set -e

# On ne vérifie QUE l'historique de l'utilisateur 'learner', car c'est le seul fiable.
FILES=("/home/learner/.bash_history")

found() {
  local pat="$1"
  for f in "${FILES[@]}"; do
    if [ -f "$f" ] && [ -r "$f" ]; then
      if grep -Eq "$pat" "$f"; then
        return 0
      fi
    fi
  done
  return 1
}

# On vérifie simplement que l'utilisateur a tenté de lancer 'su' et 'su -'.
# C'est la partie essentielle de l'exercice exécutée en tant que 'learner'.
found '^su$' || exit 1
found '^su -$' || exit 1

# On s'assure que l'utilisateur est bien revenu à son état initial.
if [[ $(whoami) != "learner" ]]; then
  exit 1
fi

echo -n "done"