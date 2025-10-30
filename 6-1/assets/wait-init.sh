#!/usr/bin/env bash
set -euo pipefail
set +x

# S'auto-détruit pour la propreté
rm $0

clear

# Affiche une animation de chargement avec un timeout de sécurité.
echo -n "Initialising Scenario..."
counter=0
while [ ! -f /ks/.initfinished ]; do
    echo -n '.'
    sleep 1;
    counter=$((counter + 1))
    if [ "$counter" -gt 60 ]; then # Timeout de 60 secondes pour plus de marge
      echo # Retour à la ligne pour l'erreur
      echo "Error: Timed out waiting for background script." >&2
      exit 1
    fi
done;
echo " done"
echo

# --- Début de la session pour l'utilisateur ---
echo 'runuser -l learner' >> ~/.bashrc
runuser -l learner
cd ~
bash /tmp/banner.sh