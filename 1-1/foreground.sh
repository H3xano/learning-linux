# foreground.sh
#!/usr/bin/env bash
set -euo pipefail
echo 'su - learner' >> ~/.bashrc
su - learner
cd ~
bash /tmp/banner.sh