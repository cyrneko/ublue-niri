#!/usr/bin/env just --justfile

# hello is recipe's name
switch-config-provider:
  bash /usr/share/scripts/config-switch.sh
