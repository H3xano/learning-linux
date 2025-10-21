# step3/verify.sh
#!/bin/bash
set -e
if [ -f script_params.sh ] && [ -x script_params.sh ] && grep -q ':-"Visiteur"' script_params.sh; then
    echo -n "done"
else
    exit 1
fi