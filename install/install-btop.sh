#!/usr/bin/env bash
set -euo pipefail

if command -v btop &>/dev/null; then
    echo "btop is already installed."
    exit 0
fi

echo "Installing btop..."
sudo apt-get update -qq
sudo apt-get install -y btop
echo "Done. btop installed."
