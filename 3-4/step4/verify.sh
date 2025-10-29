#!/bin/bash
set -e

FILE="/home/learner/nginx.conf.sample"

# Vérifie l'état final du fichier :
# 1. La ligne 'pid' n'est plus à sa place originale (ligne 5)
# 2. La ligne 'pid' est bien sous 'worker_connections'
# 3. La ligne 'gzip on;' apparaît deux fois
# On utilise awk pour vérifier l'ordre des lignes
if [ -f "$FILE" ] && \
   awk '/worker_connections/ {found=1} found && /pid/ {exit 0} ENDFILE{exit 1}' "$FILE" && \
   [ $(grep -c "gzip on;" "$FILE") -eq 2 ]; then
    echo -n "done"
else
    exit 1
fi