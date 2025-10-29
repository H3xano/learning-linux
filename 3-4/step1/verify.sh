#!/bin/bash
set -e

FILE="/home/learner/mes_notes.txt"

# Vérifie que le fichier a été modifié correctement :
# 1. Le mot "facile" ne doit plus exister
# 2. Le mot "simple" doit exister
# 3. La ligne "Nano est simple à utiliser." doit apparaître 2 fois
if [ -f "$FILE" ] && \
   ! grep -q "facile" "$FILE" && \
   grep -q "simple" "$FILE" && \
   [ $(grep -c "Nano est simple à utiliser." "$FILE") -eq 2 ]; then
    echo -n "done"
else
    exit 1
fi