#!/usr/bin/env bash
# Nous retirons 'set -e' pour cette partie pour plus de robustesse
set -uo pipefail

# --- User setup (from Formip template) ---
if ! id learner &>/dev/null; then useradd -m -s /bin/bash learner; echo "learner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/learner; chmod 440 /etc/sudoers.d/learner; fi
touch /home/learner/.bash_history; chown learner:learner /home/learner/.bash_history; chmod 600 /home/learner/.bash_history
grep -q 'Formip: realtime history' /home/learner/.bashrc || cat <<'RC' >> /home/learner/.bashrc
shopt -s histappend; HISTSIZE=10000; HISTFILESIZE=20000; PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
chown learner:learner /home/learner/.bashrc

# --- Banner Creation (Fait en premier pour s'assurer qu'il existe) ---
cat << 'EOF' > /tmp/banner.sh
#!/usr/bin/env bash
if command -v tput >/dev/null 2>&1; then COLS="$(tput cols||echo 80)";BOLD="$(tput bold)";RESET="$(tput sgr0)";CYAN="$(tput setaf 6)";YELLOW="$(tput setaf 3)";GREEN="$(tput setaf 2)"; else COLS=80;BOLD="";RESET="";CYAN="";YELLOW="";GREEN=""; fi
pad() { text="$1";len=${#1};w=$COLS;left=$(((w-len)/2));printf "%*s%s\n" "$left" "" "$text"; }
line() { ch="${1:-═}";printf '%*s\n' "$COLS" ''|tr ' ' "$ch"; }
clear; TITLE="Formip - La voie Express vers la Certification"; SUB="Bienvenue sur votre environnement Linux d'apprentissage"
echo; echo -e "${CYAN}$(line)${RESET}"; pad "${BOLD}${TITLE}${RESET}"; pad "${SUB}${RESET}"; echo -e "${CYAN}$(line)${RESET}"; echo
pad "${GREEN}Vous êtes prêt pour le Lab 4.5 : Le Détective de Fichiers !${RESET}"; echo
EOF
chmod +x /tmp/banner.sh

# --- Robust Package Installation ---
# On ajoute '|| true' pour que le script ne s'arrête pas si apt échoue.
apt-get update >/dev/null 2>&1 && apt-get install -y locate >/dev/null 2>&1 || true

# --- Lab 4.5 Specific File Setup ---
# Create the directory structure first
mkdir -p /home/learner/projets/secret
mkdir -p /home/learner/documents
mkdir -p /home/learner/archives

# Files for step 1
echo "confidentiel" > /home/learner/projets/secret/secret_rapport.txt
echo "Rapport final" > /home/learner/documents/RAPPORT_FINAL.PDF
echo "log d'application" > /home/learner/archives/app_2023.log
echo "log système" > /home/learner/archives/system_2024.log

# Files for step 2 (size and time)
# Create a file larger than 40k
dd if=/dev/zero of=/home/learner/gros_fichier.data bs=1k count=50 >/dev/null 2>&1
# Create a file that will be recent
touch /home/learner/fichier_recent.txt

# Set ownership for all created files
chown -R learner:learner /home/learner

# Pre-generate the locate database, making it robust as well
updatedb || true