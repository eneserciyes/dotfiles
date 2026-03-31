#!/usr/bin/env bash
set -euo pipefail

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

if command -v tree-sitter &>/dev/null; then
    echo "tree-sitter-cli is already installed."
    exit 0
fi

if ! command -v npm &>/dev/null; then
    echo "Error: npm not found. Run install-node.sh first."
    exit 1
fi

echo "Installing tree-sitter-cli..."
npm install -g tree-sitter-cli
echo "Done. tree-sitter-cli installed."
