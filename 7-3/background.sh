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
apt-get update >/dev/null && apt-get install -y nginx php-fpm >/dev/null || true

# --- CORRECTION FINALE ---
# 1. Supprimer la page par défaut de Nginx pour éviter les conflits
rm -f /var/www/html/index.nginx-debian.html /var/www/html/index.html

# 2. Configurer Nginx pour PHP
CONFIG_FILE="/etc/nginx/sites-available/default"
if [ -f "$CONFIG_FILE" ]; then
    sed -i 's/index index.html index.htm index.nginx-debian.html;/index index.php index.html;/' "$CONFIG_FILE"
    # This block enables PHP processing
    PHP_BLOCK_START=$(grep -n "location ~ \\\.php\$" "$CONFIG_FILE" | cut -d: -f1)
    if [ -n "$PHP_BLOCK_START" ]; then
        sed -i "${PHP_BLOCK_START},/}/ s/^#\s*//g" "$CONFIG_FILE"
    fi
fi
systemctl restart nginx
# Find the correct php-fpm service name and restart it
PHP_FPM_SERVICE=$(systemctl list-units --type=service | grep -o 'php[0-9]\.[0-9]-fpm\.service' | head -n 1)
if [ -n "$PHP_FPM_SERVICE" ]; then
    systemctl restart "$PHP_FPM_SERVICE"
fi

# 3. Créer une application PHP plus robuste
mkdir -p /tmp/source_app/mon_app
echo "DB_PASSWORD=__DB_PASSWORD__" > /tmp/source_app/mon_app/env.example
# This PHP code will throw a visible error if .env is unreadable
cat << 'PHP_EOF' > /tmp/source_app/mon_app/index.php
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

$env_path = __DIR__ . '/.env';

if (!is_readable($env_path)) {
    http_response_code(500);
    die("<h1>Erreur 500</h1><p>Le fichier de configuration (.env) est manquant ou illisible. Vérifiez les permissions !</p>");
}

echo "<h1>Bienvenue sur Mon App !</h1><p>Configuration chargée avec succès.</p>";
PHP_EOF

# 4. Créer l'archive correctement
tar -czf /home/learner/mon_app.tar.gz -C /tmp/source_app mon_app
rm -rf /tmp/source_app

# 5. S'assurer que tous les fichiers appartiennent à l'utilisateur
chown -R learner:learner /home/learner