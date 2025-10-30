#!/bin/bash

FILE=/tmp/init.sh; while ! test -f ${FILE}; do clear; sleep 0.1; done; bash ${FILE} > /tmp/init.log