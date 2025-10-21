# step5/verify.sh
#!/bin/bash
set -e
if [ -f script_rename.sh ] && [ -x script_rename.sh ] && [ -f fichier1.log.old ] && [ -f fichier2.log.old ]; then
    echo -n "done"
else
    exit 1
fi