#!/usr/bin/env bash
set -euo pipefail

if command -v stow &>/dev/null; then
    echo "stow is already installed."
    exit 0
fi

echo "Installing stow..."
sudo apt-get update -qq
sudo apt-get install -y stow
echo "Done. stow installed."
