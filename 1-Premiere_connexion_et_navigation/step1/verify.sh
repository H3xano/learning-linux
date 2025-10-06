#!/usr/bin/env bash
set -e

if ! grep -q "whoami" ~/.bash_history; then exit 1; fi
if ! grep -q "id" ~/.bash_history; then exit 1; fi
if ! grep -q "groups" ~/.bash_history; then exit 1; fi
