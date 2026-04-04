#!/usr/bin/env bash
set -euo pipefail

if dpkg -s zsh-autosuggestions &>/dev/null; then
    echo "zsh-autosuggestions is already installed."
    exit 0
fi

echo "Installing zsh-autosuggestions..."
sudo apt-get update -qq
sudo apt-get install -y zsh-autosuggestions
echo "Done. zsh-autosuggestions installed."
