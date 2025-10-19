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
pad "${GREEN}Vous êtes prêt pour le Lab 4.4 : Création et Modification !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh

# --- Lab 4.4 Specific File Setup ---
# Créer une structure pour mkdir
mkdir -p /home/learner/mon_projet/{src,docs,tests}
touch /home/learner/mon_projet/README.md
touch /home/learner/mon_projet/src/.gitignore

# Créer un fichier pour cp et mv
echo "Contenu original" > /home/learner/fichier.txt
echo "Contenu pour backup" > /home/learner/ancien.txt
touch -t 202001010000 /home/learner/ancien.txt # Timestamp ancien
echo "Contenu nouveau" > /home/learner/nouveau.txt

# Créer fichiers pour rm
touch /home/learner/fichier.txt
touch /home/learner/fichier_a_supprimer.txt
touch /home/learner/temp1.txt /home/learner/temp2.txt /home/learner/temp3.txt
touch /home/learner/temp4.txt /home/learner/temp5.txt /home/learner/temp6.txt
mkdir -p /home/learner/mon_projet/docs/src
chmod 777 /home/learner/mon_projet/docs/src # Rendre modifiable pour le test

# Set ownership for all created files
chown -R learner:learner /home/learner/mon_projet /home/learner/fichier.txt /home/learner/ancien.txt /home/learner/nouveau.txt /home/learner/temp*.txt