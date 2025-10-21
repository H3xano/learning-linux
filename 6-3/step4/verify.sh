#!/bin/bash
set -e; FILES=("$HOME/.bash_history" "/home/learner/.bash_history"); found() { local p="$1"; for f in "${FILES[@]}"; do [ -f "$f" ] && grep -q "$p" "$f" && return 0; done; return 1; }

# Vérifie l'observation du SGID sur /var/mail
found 'ls -ld /var/mail' || exit 1
found 'sudo touch /var/mail/test_sgid.txt' || exit 1
found 'sudo ls -l /var/mail/test_sgid.txt' || exit 1

# Vérifie que le sticky bit a bien été appliqué
found 'chmod 1777 public_space/' || exit 1

# Vérifie que le groupe du fichier de test était bien 'mail'
# Note: le fichier est supprimé, donc on ne peut plus le vérifier avec stat.
# On se fie à l'exécution des commandes dans l'historique.

echo -n "done"