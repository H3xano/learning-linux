#!/bin/bash
set -e
# Vérification du contenu du script
[ -f cleanup.sh ] || exit 1
grep -q '\${1:-' cleanup.sh || exit 1
grep -q '\[ ! -d' cleanup.sh || exit 1
grep -q 'for .* in' cleanup.sh || exit 1
grep -q 'COMPTEUR=' cleanup.sh || exit 1

# Créer un environnement de test propre
TEST_DIR=$(mktemp -d)
touch "$TEST_DIR/test1.log"
touch "$TEST_DIR/test2.tmp"
touch "$TEST_DIR/garder.txt"

# Exécuter le script de l'étudiant sur cet environnement
if [ -x ./cleanup.sh ]; then
    ./cleanup.sh "$TEST_DIR"
else
    bash ./cleanup.sh "$TEST_DIR"
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