#!/bin/bash
set -e

# On vérifie la présence de 'head' ET 'tail' dans l'historique.
# L'opérateur '&&' s'assure que les deux commandes grep réussissent.
if grep -qE '^\s*head' ~/.bash_history && grep -qE '^\s*tail' ~/.bash_history; then
  echo "✅ Parfait ! Vous maîtrisez l'extraction avec head et tail."
else
  # Si l'une des deux (ou les deux) manque, on renvoie une erreur.
  echo "💡 Il semble que vous n'ayez pas encore utilisé 'head' ET 'tail'."
  exit 1
fi