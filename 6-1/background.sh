#!/usr/bin/env bash
set -euo pipefail

# --- User and History Setup (Generic Part) ---
if ! id learner &>/dev/null; then useradd -m -s /bin/bash learner; echo "learner ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/learner; chmod 440 /etc/sudoers.d/learner; fi
touch /home/learner/.bash_history; chown learner:learner /home/learner/.bash_history; chmod 600 /home/learner/.bash_history
grep -q 'Formip: realtime history' /home/learner/.bashrc || cat <<'RC' >> /home/learner/.bashrc
shopt -s histappend; HISTSIZE=10000; HISTFILESIZE=20000; PROMPT_COMMAND='history -a; history -c; history -r; '"$PROMPT_COMMAND"
RC
chown learner:learner /home/learner/.bashrc

# --- Lab 6.1 Specific Setup ---
apt-get update >/dev/null && apt-get install -y acl >/dev/null

echo "Rapport standard" > /home/learner/rapport.txt && chmod 644 /home/learner/rapport.txt
mkdir /home/learner/projet && chmod 750 /home/learner/projet
ln -s /home/learner/rapport.txt /home/learner/config_link
echo '#!/bin/bash' > /home/learner/script_executable.sh && chmod 750 /home/learner/script_executable.sh

# Setup for effective permissions step
useradd -m testuser 2>/dev/null || true
groupadd testgroup 2>/dev/null || true
usermod -a -G testgroup learner
touch /home/learner/rapport_piege.txt
chown testuser:testgroup /home/learner/rapport_piege.txt
chmod 670 /home/learner/rapport_piege.txt # rw-rwx---

# Setup for ACL step
useradd -m specific_user 2>/dev/null || true
touch /home/learner/fichier_acl.txt
setfacl -m u:specific_user:rw- /home/learner/fichier_acl.txt

chown -R learner:learner /home/learner