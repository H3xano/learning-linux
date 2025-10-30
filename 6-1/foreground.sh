#!/usr/bin/env bash
set -euo pipefail
set +x # <-- CETTE LIGNE EST LA SOLUTION. Elle désactive l'affichage des commandes.

# Supprime le script lui-même pour la propreté.
# (Optionnel, mais élégant)
if [ -f "$0" ]; then rm "$0"; fi

# Nettoie l'écran pour une présentation propre.
clear

# Affiche une animation de chargement dynamique...
echo -n "Waiting for environment setup to complete..."
counter=0
while [ ! -f /tmp/background_finished ]; do
  echo -n "."
  sleep 1
  counter=$((counter + 1))
  
  # ...tout en ayant un timeout de sécurité !
  if [ "$counter" -gt 30 ]; then
    echo # Ajoute un retour à la ligne pour la propreté du message d'erreur
    echo "Error: Timed out waiting for background script." >&2
    exit 1
  fi
done
echo " done."
echo # Ligne vide pour l'espacement

# Lance la session utilisateur comme prévu.
# Note: la commande 'echo' ci-dessous est intentionnelle et correcte.
# Elle ajoute la commande 'runuser' au .bashrc pour les futures sessions.
echo 'runuser -l learner' >> ~/.bashrc
runuser -l learner
cd ~
bash /tmp/banner.sh