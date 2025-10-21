# step4/verify.sh
#!/bin/bash
set -e
if [ -f script_condition.sh ] && [ -x script_condition.sh ] && grep -q 'if \[ "\$#" -ne 1 \]' script_condition.sh; then
    echo -n "done"
else
    exit 1
fi