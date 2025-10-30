#!/bin/bash

rm $0

clear

echo -n "Initialising Scenario..."

echo -n "Waiting for environment setup to complete..."
counter=0
while [ ! -f /tmp/background_finished ]; do
    echo -n '.'
    sleep 1;
done;
echo " done."
echo
echo 'runuser -l learner' >> ~/.bashrc
runuser -l learner
cd ~
bash /tmp/banner.sh