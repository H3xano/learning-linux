#!/bin/bash
set -e

# Vérifie que le fichier config a bien été modifié (ce qui implique de passer en mode INSERT)
if [ -f /home/learner/config_template.txt ] && grep -q "enabled = true" /home/learner/config_template.txt; then
    echo -n "done"
else
    exit 1
fi