#!/usr/bin/env bash
set -euo pipefail
if ! id learner &>/dev/null; then useradd -m -s /bin/bash learner; echo "learner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/learner; chmod 440 /etc/sudoers.d/learner; fi
touch /home/learner/.bash_history; chown learner:learner /home/learner/.bash_history; chmod 600 /home/learner/.bash_history
grep -q 'Formip: realtime history' /home/learner/.bashrc || cat <<'RC' >> /home/learner/.bashrc
shopt -s histappend; HISTSIZE=10000; HISTFILESIZE=20000; PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
chown learner:learner /home/learner/.bashrc
cat << 'EOF' > /tmp/banner.sh
#!/usr/bin/env bash
if command -v tput >/dev/null 2>&1; then COLS="$(tput cols||echo 80)";BOLD="$(tput bold)";RESET="$(tput sgr0)";CYAN="$(tput setaf 6)";YELLOW="$(tput setaf 3)";GREEN="$(tput setaf 2)"; else COLS=80;BOLD="";RESET="";CYAN="";YELLOW="";GREEN=""; fi
pad() { text="$1";len=${#1};w=$COLS;left=$(((w-len)/2));printf "%*s%s\n" "$left" "" "$text"; }
line() { ch="${1:-═}";printf '%*s\n' "$COLS" ''|tr ' ' "$ch"; }
clear; TITLE="Formip - La voie Express vers la Certification"; SUB="Bienvenue sur votre environnement Linux d'apprentissage"
echo; echo -e "${CYAN}$(line)${RESET}"; pad "${BOLD}${TITLE}${RESET}"; pad "${SUB}${RESET}"; echo -e "${CYAN}$(line)${RESET}"; echo
pad "${GREEN}Vous êtes prêt pour le Lab 7.3 : L'Admin Sys en Action !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh

# --- Lab 7.3 Specific File Setup ---
# Simplification de l'installation pour éviter les erreurs
apt-get update >/dev/null && apt-get install -y nginx php-fpm >/dev/null || true

# --- CORRECTION FINALE : Méthode de création de l'archive 100% robuste ---
# 1. Créer la structure source dans /tmp (zone sûre)
mkdir -p /tmp/source_app/mon_app
echo "DB_PASSWORD=__DB_PASSWORD__" > /tmp/source_app/mon_app/env.example
echo "<?php echo '<h1>Bienvenue sur Mon App !</h1><p>Configuration chargée avec succès.</p>';" > /tmp/source_app/mon_app/index.php
echo "<?php require_once __DIR__ . '/.env';" > /tmp/source_app/mon_app/config.php

# 2. Créer l'archive à partir de cette source et la placer dans le home de l'utilisateur
# -C /tmp/source_app : se place dans ce dossier avant d'archiver
# mon_app : archive le dossier mon_app qui s'y trouve
tar -czf /home/learner/mon_app.tar.gz -C /tmp/source_app mon_app

# 3. Nettoyer la source temporaire
rm -rf /tmp/source_app

# 4. S'assurer que tous les fichiers dans /home/learner appartiennent bien à l'utilisateur
chown -R learner:learner /home/learner