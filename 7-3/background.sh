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
pad "${GREEN}Vous êtes prêt pour le Lab 7.3 : Le Couteau Suisse de l'Admin Sys !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh

# --- ENVIRONMENT SETUP ---
echo "Préparation de l'environnement (Nginx/PHP/SSH)..."
apt-get update >/dev/null && apt-get install -y nginx php-fpm openssh-server util-linux >/dev/null

# --- CONFIGURATION SSH INFALLIBLE ---
# 1. S'assurer que les options vitales sont dans la config du serveur SSH
sed -i 's/^#?PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sed -i 's/^#?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config
echo "ChallengeResponseAuthentication no" >> /etc/ssh/sshd_config

# 2. Redémarrer le service SSH pour appliquer la nouvelle configuration
systemctl restart ssh

# 3. Créer une clé SSH pour l'utilisateur learner, sans mot de passe
su - learner -c "ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -N ''"

# 4. Autoriser cette clé pour se connecter en tant que learner
su - learner -c "cat ~/.ssh/id_ed25519.pub >> ~/.ssh/authorized_keys"

# 5. Définir les bonnes permissions (crucial pour la sécurité SSH)
su - learner -c "chmod 700 ~/.ssh && chmod 600 ~/.ssh/authorized_keys"

# 6. Pré-accepter la clé de l'hôte localhost pour éviter la question (yes/no)
su - learner -c "ssh-keyscan -t ed25519 localhost >> ~/.ssh/known_hosts 2>/dev/null"

# --- CRITICAL LAB FILE SETUP ---
# ... (le reste du fichier est identique)

# 1. Prepare the app source files
mkdir -p /home/learner/mon_app
echo "DB_PASSWORD=__DB_PASSWORD__" > /home/learner/mon_app/env.example
cat << 'PHP_EOF' > /home/learner/mon_app/index.php
<?php
error_reporting(E_ALL); ini_set('display_errors', 1);
$config_loaded = @include_once __DIR__ . '/config.php';
if ($config_loaded === false) {
    http_response_code(500);
    die("<h1>Erreur 500</h1><p>Impossible de charger config.php. Vérifiez le fichier et ses permissions.</p>");
}
echo "<h1>Bienvenue sur Mon App !</h1><p>Application principale chargée avec succès.</p>";
PHP_EOF
cat << 'PHP_CONFIG_EOF' > /home/learner/mon_app/config.php
<?php
$env_path = __DIR__ . '/.env';
if (!is_readable($env_path)) {
    trigger_error("Le fichier de configuration (.env) est manquant ou illisible. Vérifiez les permissions !", E_USER_ERROR);
    http_response_code(500);
    exit("Configuration error.");
}
PHP_CONFIG_EOF

# 2. Simulate a "local machine" with the archive ready for transfer
mkdir -p /home/learner/local_machine_simulation
tar -czf /home/learner/local_machine_simulation/mon_app.tar.gz -C /home/learner mon_app
rm -rf /home/learner/mon_app

# 3. Simulate a large log file for the disk space exercise
echo "Création d'un gros fichier de log pour la simulation..."
fallocate -l 1G /var/log/nginx/access.log.old
chown www-data:adm /var/log/nginx/access.log.old

# --- WEB SERVER CONFIGURATION ---
(
    cat << 'NGINX_CONF' > /etc/nginx/sites-available/default
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/html;
    index index.php index.html index.htm;
    server_name _;
    location / { try_files $uri $uri/ =404; }
    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/run/php/php-fpm.sock;
    }
}
NGINX_CONF
    systemctl restart nginx
    PHP_FPM_SERVICE=$(systemctl list-units --type=service | grep -o 'php[0-9]\.[0-9]-fpm\.service' | head -n 1)
    if [ -n "$PHP_FPM_SERVICE" ]; then
        sed -i 's|listen = /run/php/php.*-fpm.sock|listen = /run/php/php-fpm.sock|' /etc/php/*/fpm/pool.d/www.conf
        systemctl restart "$PHP_FPM_SERVICE"
    fi
) || echo "Avertissement : La configuration de l'environnement web a rencontré des problèmes."

chown -R learner:learner /home/learner