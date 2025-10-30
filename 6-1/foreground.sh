#!/usr/bin/env bash
set -euo pipefail
echo 'runuser -l learner' >> ~/.bashrc
runuser -l learner
cd ~
bash /tmp/banner.sh