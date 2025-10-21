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
apt-get update >/dev/null && apt-get install -y nginx php-fpm >/dev/null

# Configure Nginx to work with PHP
sed -i 's/index index.html index.htm index.nginx-debian.html;/index index.php index.html;/' /etc/nginx/sites-available/default
sed -i '/location ~ \\.php$ {/s/^#//' /etc/nginx/sites-available/default
sed -i '/include snippets\/fastcgi-php.conf;/s/^#//' /etc/nginx/sites-available/default
sed -i '/fastcgi_pass unix:\/run\/php\/php-fpm.sock;/s/^#//' /etc/nginx/sites-available/default
sed -i '/}/s/^#//' /etc/nginx/sites-available/default
systemctl restart nginx
systemctl restart php7.4-fpm || systemctl restart php8.1-fpm || true

# Create a dummy web app
mkdir -p /home/learner/mon_app
echo "DB_PASSWORD=__DB_PASSWORD__" > /home/learner/mon_app/env.example
echo "<?php echo '<h1>Bienvenue sur Mon App !</h1><p>Configuration chargée avec succès.</p>';" > /home/learner/mon_app/index.php
echo "<?php require_once __DIR__ . '/.env';" > /home/learner/mon_app/config.php

tar -czf /home/learner/mon_app.tar.gz -C /home/learner mon_app

chown -R learner:learner /home/learner