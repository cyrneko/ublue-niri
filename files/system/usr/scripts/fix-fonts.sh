#!/bin/bash

echo "moving fonts from system dir to user dir..."
mkdir -p "$HOME/.fonts"
cp -r "/usr/share/fonts/FiraCode/*" "$HOME/.fonts"
echo "done!"
