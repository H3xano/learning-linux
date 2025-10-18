#!/bin/bash
set -e

# On cherche si la commande 'less' a été exécutée.
grep -qE '^\s*less' ~/.bash_history

echo "✅ Excellent ! Vous savez maintenant naviguer avec less."