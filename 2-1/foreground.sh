# foreground.sh
#!/usr/bin/env bash
set -euo pipefail
su - learner -c 'cd ~ && bash /tmp/banner.sh && exec bash'