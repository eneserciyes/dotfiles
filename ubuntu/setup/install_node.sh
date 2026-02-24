#!/bin/bash

set -e

echo "Installing Node.js 22.x LTS..."

if command -v node &> /dev/null; then
    echo "Node.js is already installed: $(node --version)"
    exit 0
fi

curl -fsSL https://deb.nodesource.com/setup_22.x | sudo -E bash -
sudo apt install -y nodejs

echo "Node.js $(node --version) installed successfully!"
