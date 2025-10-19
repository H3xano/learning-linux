#!/bin/bash
set -e

# Vérifie que nano a été utilisé et que le fichier a été créé
if [ -f /home/learner/mes_notes.txt ] && grep -q "facile" /home/learner/mes_notes.txt; then
    echo -n "done"
else
    exit 1
fi