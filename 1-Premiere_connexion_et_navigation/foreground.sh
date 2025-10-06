#!/usr/bin/env bash
set -euo pipefail
su - learner
cd ~
if [ -f /tmp/banner.sh ]; then
  bash /tmp/banner.sh
else
  echo "Banner non trouvé (/tmp/banner.sh manquant)"
fi