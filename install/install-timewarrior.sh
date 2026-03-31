#!/usr/bin/env bash
set -euo pipefail

if command -v timew &>/dev/null; then
    echo "timewarrior is already installed."
    exit 0
fi

echo "Installing timewarrior..."
sudo apt-get update -qq
sudo apt-get install -y timewarrior
echo "Done. timewarrior installed."
