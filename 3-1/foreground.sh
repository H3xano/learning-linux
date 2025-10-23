#!/usr/bin/env bash
set -euo pipefail
echo 'su - learner' >> ~/.bashrc
# --- Lancement du simulateur de log en arrière-plan ---
# Ce script simule un fichier de log qui se remplit en temps réel.
(
  count=0
  while true; do
    sleep 3
    count=$((count+1))
    echo "$(date): INFO - Événement normal N°$count." >> /home/learner/live_stream.log
    sleep 2
    if [ $(($count % 2)) -eq 0 ]; then
      echo "$(date): ERROR - Une erreur simulée est survenue !" >> /home/learner/live_stream.log
    fi
  done
) &
su - learner
cd ~
bash /tmp/banner.sh