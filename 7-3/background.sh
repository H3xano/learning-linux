#!/usr/bin/env bash
set -euo pipefail

# --- User and Banner Setup (proven to be reliable) ---
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

# --- CRITICAL LAB FILE SETUP ---
# Cette partie est essentielle et doit réussir.

# 1. Créer la structure de l'application
mkdir -p /home/learner/mon_app
echo "DB_PASSWORD=__DB_PASSWORD__" > /home/learner/mon_app/env.example
# Le code PHP est rendu plus robuste pour l'étape de dépannage
cat << 'PHP_EOF' > /home/learner/mon_app/index.php
<?php
error_reporting(E_ALL);
ini_set('display_errors', 1);

// Le @ supprime les avertissements si le fichier n'existe pas, on gère l'erreur nous-mêmes.
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
    // Ne pas utiliser die() ici pour permettre à Nginx de logger l'erreur PHP
    trigger_error("Le fichier de configuration (.env) est manquant ou illisible. Vérifiez les permissions !", E_USER_ERROR);
    // On ne devrait jamais arriver ici si les erreurs sont bien configurées
    http_response_code(500);
    exit("Configuration error.");
}

// Le reste du code ne sera pas exécuté si le .env est illisible.
PHP_CONFIG_EOF


# 2. Créer l'archive correctement
# -C /home/learner : se place dans ce dossier avant d'archiver
# mon_app : archive le dossier mon_app qui s'y trouve
tar -czf /home/learner/mon_app.tar.gz -C /home/learner mon_app

# 3. Nettoyer le dossier source pour que l'étudiant doive l'extraire
rm -rf /home/learner/mon_app

# --- NON-CRITICAL ENVIRONMENT SETUP ---
# Cette partie est pour le réalisme. On ajoute '|| true' pour que `set -e`
# n'arrête pas le script si l'installation de Nginx/PHP échoue.
echo "Préparation de l'environnement web (Nginx/PHP)..."
(
    apt-get update >/dev/null && apt-get install -y nginx php-fpm >/dev/null
    rm -f /var/www/html/index.nginx-debian.html /var/www/html/index.html
    CONFIG_FILE="/etc/nginx/sites-available/default"
    if [ -f "$CONFIG_FILE" ]; then
        sed -i 's/index index.html index.htm index.nginx-debian.html;/index index.php index.html;/' "$CONFIG_FILE"
        sed -i -E '/location ~ \\.php\$/,/}/s/^(\s*)#/\1/' "$CONFIG_FILE"
    fi
    systemctl restart nginx
    PHP_FPM_SERVICE=$(systemctl list-units --type=service | grep -o 'php[0-9]\.[0-9]-fpm\.service' | head -n 1)
    [ -n "$PHP_FPM_SERVICE" ] && systemctl restart "$PHP_FPM_SERVICE"
) || echo "Avertissement : La configuration de l'environnement web a rencontré des problèmes, mais les fichiers du lab sont prêts."


# --- Final Ownership ---
# S'assure que tout dans /home/learner appartient à l'utilisateur
chown -R learner:learner /home/learner