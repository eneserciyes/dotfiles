#!/usr/bin/env bash
set -euo pipefail

if command -v wget &>/dev/null; then
    echo "wget is already installed."
    exit 0
fi

echo "Installing wget..."
sudo apt-get update -qq
sudo apt-get install -y wget
echo "Done. wget installed."
