#!/usr/bin/env bash
set -euo pipefail

if command -v rustup &>/dev/null; then
    echo "rustup is already installed ($(rustup --version))."
    exit 0
fi

echo "Installing rustup..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
echo "Done. rustup installed."
