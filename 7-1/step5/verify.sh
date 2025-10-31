#!/bin/bash
set -e
grep -q 'continue' /home/learner/script_rename.sh || exit 1
grep -q 'if \[\[ "\$fichier" == \*.log \]\]' /home/learner/script_rename.sh || exit 1

# On vérifie le résultat final en utilisant des chemins absolus
if [ ! -f /home/learner/fichier1.log.old ] || \
   [ ! -f /home/learner/fichier2.log.old ] || \
   [ ! -f /home/learner/config.log.lock ]; then
    exit 1
fi
if [ -f /home/learner/fichier1.log ] || [ -f /home/learner/fichier2.log ]; then
    exit 1
fi

echo -n "done"