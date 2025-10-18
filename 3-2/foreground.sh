#!/usr/bin/env bash
set -euo pipefail

# --- Passage à l'utilisateur 'learner' et affichage de la bannière ---
# Le 'su - learner' est essentiel pour charger l'environnement de l'apprenant
# et exécuter le .bashrc
su - learner
cd ~ 
bash /tmp/banner.sh