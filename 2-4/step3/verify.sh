#!/bin/bash
set -e
# Vérifie que les variables sont dans .bashrc
if ! grep -q 'export LOG_DIR' /home/learner/.bashrc || ! grep -q 'export PATH="\$HOME/bin:\$PATH"' /home/learner/.bashrc; then
    exit 1
fi
# Vérifie que le script de test a été créé et est exécutable
if ! [ -x "/home/learner/bin/hello" ]; then
    exit 1
fi
echo -n "done"