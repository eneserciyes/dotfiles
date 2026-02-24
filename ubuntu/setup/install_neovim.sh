#!/bin/bash

set -e

echo "Installing Neovim..."

if command -v nvim &> /dev/null; then
    echo "Neovim is already installed: $(nvim --version | head -1)"
else
    ARCH=$(uname -m)
    case "$ARCH" in
        x86_64) NVIM_ARCH="x86_64" ;;
        aarch64|arm64) NVIM_ARCH="arm64" ;;
        *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
    esac

    TEMP_DIR=$(mktemp -d)
    curl -Lo "$TEMP_DIR/nvim.tar.gz" "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-${NVIM_ARCH}.tar.gz"
    sudo tar xzf "$TEMP_DIR/nvim.tar.gz" -C /opt
    sudo ln -sf /opt/nvim-linux-${NVIM_ARCH}/bin/nvim /usr/local/bin/nvim
    rm -rf "$TEMP_DIR"

    if ! command -v nvim &> /dev/null; then
        echo "Neovim installation failed"
        exit 1
    fi

    echo "Neovim $(nvim --version | head -1) installed successfully!"
fi

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
