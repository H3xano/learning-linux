#!/bin/bash
set -e

FILE="/home/learner/nginx.conf.sample"

# Vérifie que le commentaire a été correctement nettoyé
if [ -f "$FILE" ] && \
   grep -q "# coeurs CPU" "$FILE" && \
   ! grep -q "Mettre le nombre de" "$FILE"; then
    echo -n "done"
else
    exit 1
fi