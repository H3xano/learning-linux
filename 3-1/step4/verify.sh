#!/bin/bash
set -e

# On cherche la chaîne exacte 'tail -f' pour valider la compétence de surveillance.
# C'est plus précis que de chercher juste 'tail'.
grep -q 'tail -f' ~/.bash_history

echo "✅ Mission accomplie ! Vous surveillez les fichiers en temps réel."