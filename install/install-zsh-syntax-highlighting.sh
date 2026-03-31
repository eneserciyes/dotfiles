#!/usr/bin/env bash
set -euo pipefail

if dpkg -s zsh-syntax-highlighting &>/dev/null; then
    echo "zsh-syntax-highlighting is already installed."
    exit 0
fi

echo "Installing zsh-syntax-highlighting..."
sudo apt-get update -qq
sudo apt-get install -y zsh-syntax-highlighting
echo "Done. zsh-syntax-highlighting installed."
