#!/usr/bin/env bash
set -euo pipefail

if command -v rg &>/dev/null; then
    echo "ripgrep is already installed."
    exit 0
fi

echo "Installing ripgrep..."
sudo apt-get update -qq
sudo apt-get install -y ripgrep
echo "Done. ripgrep installed."
