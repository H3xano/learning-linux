#!/usr/bin/env bash
set -euo pipefail
set +x

# S'auto-détruit pour la propreté
rm $0

clear

# Affiche une animation de chargement avec un timeout de sécurité.
echo -n "Initialisation du Scénario..."
counter=0
while [ ! -f /ks/.initfinished ]; do
    echo -n '.'
    sleep 1;
done;
echo " done"
sleep 3
clear

# --- Fallback en cas de deconnexion de la session utilisateur ---
echo 'runuser -l learner' >> ~/.bashrc