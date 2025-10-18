#!/bin/bash
set -e

# On cherche si la commande 'cat' a été exécutée au moins une fois.
# grep -q est silencieux et renvoie un code de succès (0) s'il trouve une correspondance.
grep -qE '^\s*cat' ~/.bash_history

echo "✅ Bravo ! Vous avez bien utilisé la commande cat."