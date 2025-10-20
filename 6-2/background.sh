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
pad "${GREEN}Vous êtes prêt pour le Lab 6.2 : Le Maître des Propriétés !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh

# --- Lab 6.2 Specific File Setup ---
useradd testuser 2>/dev/null || true
groupadd equipe 2>/dev/null || true

touch /home/learner/rapport.txt
touch /home/learner/site_config.conf

mkdir -p /home/learner/projet_alpha/src
touch /home/learner/projet_alpha/main.py
touch /home/learner/projet_alpha/src/utils.py

# --- CORRECTION ICI ---
mkdir -p /home/learner/projet_casse_source
touch /home/learner/projet_casse_source/fichier1.txt
touch /home/learner/projet_casse_source/fichier2.txt
# On archive le dossier 'projet_casse_source' en le renommant 'projet_casse' dans l'archive
tar -czf /home/learner/projet_casse.tar.gz -C /home/learner projet_casse_source --transform 's|projet_casse_source|projet_casse|' --owner=1234 --group=5678
rm -rf /home/learner/projet_casse_source

chown -R learner:learner /home/learner