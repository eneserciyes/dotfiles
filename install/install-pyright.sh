#!/usr/bin/env bash
set -euo pipefail

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

if command -v pyright-langserver &>/dev/null; then
    echo "pyright is already installed."
    exit 0
fi

if ! command -v npm &>/dev/null; then
    echo "Error: npm not found. Run install-node.sh first."
    exit 1
fi

echo "Installing pyright..."
npm install -g pyright
echo "Done. pyright installed."
