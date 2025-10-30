#!/usr/bin/env bash
set -euo pipefail
set +x

# Wait for the signal file from the background script.
# This loop will check for the file every second for up to 30 seconds.
echo "Waiting for environment setup to complete..."
counter=0
while [ ! -f /tmp/background_finished ]; do
  sleep 1
  counter=$((counter + 1))
  if [ "$counter" -gt 30 ]; then
    echo "Error: Timed out waiting for background script." >&2
    exit 1
  fi
done
echo "Setup complete. Starting session."

echo 'runuser -l learner' >> ~/.bashrc
runuser -l learner
cd ~
bash /tmp/banner.sh