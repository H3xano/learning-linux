#!/bin/bash
set -e

# On vérifie que la commande exacte a été tapée par l'utilisateur.
FILES=("/home/learner/.bash_history")
found() {
  local pat="$1"
  for f in "${FILES[@]}"; do
    if [ -f "$f" ] && grep -qF "$pat" "$f"; then
      return 0
    fi
  done
  return 1
}

if found 'echo "Je sais utiliser le terminal"'; then
  echo -n "done"
else
  exit 1
fi