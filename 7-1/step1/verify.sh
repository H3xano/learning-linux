# step1/verify.sh
#!/bin/bash
set -e
if [ -f premier_script.sh ] && [ -x premier_script.sh ]; then
    echo -n "done"
else
    exit 1
fi