#!/usr/bin/env bash
set -euo pipefail
echo 'su - learner' >> ~/.bashrc
echo "killercoda" |su - learner
cd ~
bash /tmp/banner.sh