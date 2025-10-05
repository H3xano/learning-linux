#!/usr/bin/env bash
set -euo pipefail

# Exécuter le banner
if [ -f /tmp/banner.sh ]; then
  bash /tmp/banner.sh
else
  echo "Banner non trouvé (/tmp/banner.sh manquant)"
fi
