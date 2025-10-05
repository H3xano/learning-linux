#!/usr/bin/env bash
set -euo pipefail

# Trouver le dossier contenant ce script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Rendre exécutable le banner
chmod +x "${SCRIPT_DIR}/formip-banner.sh"

# Afficher immédiatement le banner
"${SCRIPT_DIR}/formip-banner.sh" || true

# Installer le banner pour chaque nouveau terminal ouvert
install -m 0755 "${SCRIPT_DIR}/formip-banner.sh" /etc/profile.d/00-formip-banner.sh
