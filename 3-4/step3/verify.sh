#!/bin/bash
set -e

FILE="/home/learner/nginx.conf.sample"

# Vérifie l'état final du fichier après les étapes 2 et 3 :
# 1. La ligne 'user www-data;' doit toujours exister (prouve que 'u' a fonctionné)
# 2. La ligne worker_processes doit contenir '8' (prouve que la modif de l'étape 2 a été sauvegardée)
if [ -f "$FILE" ] && \
   grep -q "user www-data;" "$FILE" && \
   grep -q "worker_processes 8;" "$FILE"; then
    echo -n "done"
else
    exit 1
fi