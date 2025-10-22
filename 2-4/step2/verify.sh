#!/bin/bash
set -e
# Vérifie que .bashrc a bien été modifié et rechargé
if ! grep -q "alias ll='ls -lah'" /home/learner/.bashrc || ! grep -q 'export NGINX_LOGS' /home/learner/.bashrc; then
    exit 1
fi