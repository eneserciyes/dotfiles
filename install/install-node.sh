#!/usr/bin/env bash
set -euo pipefail

export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

if [ -s "$NVM_DIR/nvm.sh" ]; then
    source "$NVM_DIR/nvm.sh"
fi

if command -v node &>/dev/null; then
    echo "node is already installed ($(node --version))."
    exit 0
fi

echo "Installing nvm and Node.js LTS..."

if [ ! -s "$NVM_DIR/nvm.sh" ]; then
    mkdir -p "$NVM_DIR"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
    source "$NVM_DIR/nvm.sh"
fi

nvm install --lts
echo "Done. Node.js $(node --version) installed via nvm."
