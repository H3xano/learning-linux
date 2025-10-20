#!/bin/bash
set -euo pipefail
# Script d'accueil (bannière, etc.)
su - learner 
cd ~
LAB_TITLE="6.1 : Lire les Permissions"
/usr/local/bin/banner.sh \"${LAB_TITLE}\"