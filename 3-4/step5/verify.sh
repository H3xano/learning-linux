#!/bin/bash
set -e

FILE="/home/learner/nginx.conf.sample"

# Vérifie que le remplacement a bien eu lieu :
# 1. Les logs nginx ne doivent plus exister
# 2. Les logs webapp doivent exister
if [ -f "$FILE" ] && \
   ! grep -q "nginx/access.log" "$FILE" && \
   ! grep -q "nginx/error.log" "$FILE" && \
   grep -q "webapp/access.log" "$FILE" && \
   grep -q "webapp/error.log" "$FILE"; then
    echo -n "done"
else
    exit 1
fi