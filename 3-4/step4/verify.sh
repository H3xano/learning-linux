#!/bin/bash
set -e

FILE="/home/learner/config_template.txt"

# Vérifie l'état final du fichier :
# 1. La ligne 'user = admin' ne doit plus exister
# 2. La ligne 'port = 8080' doit apparaître deux fois
if [ -f "$FILE" ] && \
   ! grep -q "user = admin" "$FILE" && \
   [ $(grep -c "port = 8080" "$FILE") -eq 2 ]; then
    echo -n "done"
else
    exit 1
fi