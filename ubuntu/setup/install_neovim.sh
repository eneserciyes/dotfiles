#!/bin/bash

set -e

echo "Installing Neovim from source..."

BUILD_DIR=$(mktemp -d)
git clone --branch stable https://github.com/neovim/neovim "$BUILD_DIR/neovim"
cd "$BUILD_DIR/neovim"
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install
cd /
rm -rf "$BUILD_DIR"

if ! command -v nvim &> /dev/null; then
    echo "Neovim installation failed"
    exit 1
fi

echo "Neovim $(nvim --version | head -1) installed successfully!"

# Backup existing Neovim config if it exists
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Backing up existing Neovim config..."
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Install LazyVim
echo "Installing LazyVim..."
git clone https://github.com/LazyVim/starter "$NVIM_CONFIG_DIR"
rm -rf "$NVIM_CONFIG_DIR/.git"

echo "LazyVim installed successfully!"
echo "First run of nvim will install plugins automatically."
