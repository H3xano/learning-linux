#!/bin/bash
set -euo pipefail

# S'auto-détruit pour garder l'environnement propre.
rm $0

# Crée le répertoire pour les logs et autres fichiers.
mkdir -p /ks

# --- Toute la logique de configuration du lab ---
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
pad "${GREEN}Vous êtes prêt pour le Lab 6.1 : Le Code des Droits !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh
apt-get update >/dev/null 2>&1
apt-get install -y acl >/dev/null 2>&1

touch /home/learner/rapport.txt && chmod 644 /home/learner/rapport.txt
mkdir /home/learner/projet && chmod 750 /home/learner/projet
ln -s /home/learner/rapport.txt /home/learner/config_link
echo '#!/bin/bash' > /home/learner/script_executable.sh && chmod 750 /home/learner/script_executable.sh

mkdir /home/learner/dossier_interdit && chmod 644 /home/learner/dossier_interdit

useradd testuser 2>/dev/null || true
groupadd equipe 2>/dev/null || true
usermod -a -G equipe learner
usermod -a -G equipe testuser

touch /home/learner/rapport_piege.txt
chown testuser:equipe /home/learner/rapport_piege.txt
chmod 0070 /home/learner/rapport_piege.txt

touch /home/learner/rapport_piege2.txt
chown learner:equipe /home/learner/rapport_piege2.txt
chmod 0070 /home/learner/rapport_piege2.txt

useradd specific_user 2>/dev/null || true
touch /home/learner/fichier_acl.txt
setfacl -m u:specific_user:rw- /home/learner/fichier_acl.txt

chown learner:learner /home/learner/rapport.txt /home/learner/projet /home/learner/config_link /home/learner/script_executable.sh /home/learner/fichier_acl.txt

chmod o+x /home/learner

# --- Fin de la logique de configuration ---

# Marque l'initialisation comme terminée pour le script wait-init.sh
touch /ks/.initfinished