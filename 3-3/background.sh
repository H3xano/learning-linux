#!/usr/bin/env bash
set -euo pipefail

# --- User setup ---
if ! id learner &>/dev/null; then useradd -m -s /bin/bash learner; echo "learner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/learner; chmod 440 /etc/sudoers.d/learner; fi
touch /home/learner/.bash_history; chown learner:learner /home/learner/.bash_history; chmod 600 /home/learner/.bash_history
grep -q 'Formip: realtime history' /home/learner/.bashrc || cat <<'RC' >> /home/learner/.bashrc
shopt -s histappend; HISTSIZE=10000; HISTFILESIZE=20000; PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
chown learner:learner /home/learner/.bashrc

# --- Banner ---
cat << 'EOF' > /tmp/banner.sh
#!/usr/bin/env bash
if command -v tput >/dev/null 2>&1; then COLS="$(tput cols||echo 80)";BOLD="$(tput bold)";RESET="$(tput sgr0)";CYAN="$(tput setaf 6)";YELLOW="$(tput setaf 3)";GREEN="$(tput setaf 2)"; else COLS=80;BOLD="";RESET="";CYAN="";YELLOW="";GREEN=""; fi
pad() { text="$1";len=${#1};w=$COLS;left=$(((w-len)/2));printf "%*s%s\n" "$left" "" "$text"; }
line() { ch="${1:-═}";printf '%*s\n' "$COLS" ''|tr ' ' "$ch"; }
clear; TITLE="Formip - La voie Express vers la Certification"; SUB="Bienvenue sur votre environnement Linux d'apprentissage"
echo; echo -e "${CYAN}$(line)${RESET}"; pad "${BOLD}${TITLE}${RESET}"; pad "${SUB}${RESET}"; echo -e "${CYAN}$(line)${RESET}"; echo
pad "${GREEN}Vous êtes prêt pour le Lab 3.3 : Le Langage des Motifs !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh

# --- Lab 3.3 Specific File Setup (MODIFIED) ---
cat << EOF > /home/learner/data.txt
Le chat est sur le toit.
Le bot a bien fonctionné.
Un but a été marqué.
I prefer the color red.
I prefer the colour blue.
Un fichier, des fichiers.
START of the line... end of the line
Code Produit: ABC-12345
Ligne de code: XYZ-98765
Utilisateur: user_alpha
# Ceci est un commentaire
WARNING: Disk space is low.
ERROR: Connection failed.
Process ended successfully.
Fin de la transaction.
OK
IP du serveur: 192.168.1.1
Répétition: test-test-
Répétition: test-test-test-
Code: AB{123}
EOF

chown learner:learner /home/learner/data.txt