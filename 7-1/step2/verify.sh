# step2/verify.sh
#!/bin/bash
set -e
if [ -f script_variables.sh ] && [ -x script_variables.sh ] && grep -q "DATE_JOUR" script_variables.sh; then
    echo -n "done"
else
    exit 1
fi