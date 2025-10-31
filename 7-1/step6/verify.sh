#!/bin/bash
set -e
# Vérification du contenu du script
[ -f /home/learner/cleanup.sh ] || exit 1
grep -q '\${1:-' /home/learner/cleanup.sh || exit 1
grep -q '\[ ! -d' /home/learner/cleanup.sh || exit 1
grep -q 'for .* in' /home/learner/cleanup.sh || exit 1
grep -q 'COMPTEUR=' /home/learner/cleanup.sh || exit 1

# Créer un environnement de test propre
TEST_DIR=$(mktemp -d)
touch "$TEST_DIR/test1.log"
touch "$TEST_DIR/test2.tmp"
touch "$TEST_DIR/garder.txt"

# Exécuter le script de l'étudiant sur cet environnement
if [ -x /home/learner/cleanup.sh ]; then
    /home/learner/cleanup.sh "$TEST_DIR"
else
    bash /home/learner/cleanup.sh "$TEST_DIR"
fi

# Vérifier le résultat
if [ -f "$TEST_DIR/test1.log" ] || \
   [ -f "$TEST_DIR/test2.tmp" ] || \
   [ ! -f "$TEST_DIR/garder.txt" ]; then
   rm -rf "$TEST_DIR"
   exit 1
fi

rm -rf "$TEST_DIR"
echo -n "done"