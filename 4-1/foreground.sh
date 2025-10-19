# foreground.sh
#!/usr/bin/env bash
set -euo pipefail
# Passage à l'utilisateur 'learner' et affichage de la bannière
su - learner
cd ~ 
bash /tmp/banner.sh