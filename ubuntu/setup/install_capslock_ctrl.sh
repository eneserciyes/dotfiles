#!/bin/bash

set -e

echo "Remapping Caps Lock to Ctrl..."

if command -v gsettings &> /dev/null; then
    gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"
    echo "Caps Lock remapped to Ctrl via gsettings (GNOME)."
elif command -v setxkbmap &> /dev/null; then
    setxkbmap -option ctrl:nocaps
    echo "Caps Lock remapped to Ctrl via setxkbmap."
    echo "Note: This change is not persistent across reboots."
    echo "Add 'setxkbmap -option ctrl:nocaps' to your ~/.bashrc for persistence."
else
    echo "Neither gsettings nor setxkbmap found. Could not remap Caps Lock."
    exit 1
fi
