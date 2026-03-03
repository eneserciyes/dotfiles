#!/bin/bash

set -euo pipefail

echo "Installing Neovim and LazyVim..."

if command -v nvim &> /dev/null; then
    echo "Neovim is already installed: $(nvim --version | head -1)"
else
    ARCH="$(uname -m)"
    case "$ARCH" in
        x86_64) NVIM_ARCH="x86_64" ;;
        aarch64|arm64) NVIM_ARCH="arm64" ;;
        *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
    esac

    TEMP_DIR="$(mktemp -d)"
    curl -Lo "$TEMP_DIR/nvim.tar.gz" "https://github.com/neovim/neovim/releases/download/stable/nvim-linux-${NVIM_ARCH}.tar.gz"
    sudo rm -rf "/opt/nvim-linux-${NVIM_ARCH}"
    sudo tar xzf "$TEMP_DIR/nvim.tar.gz" -C /opt
    rm -rf "$TEMP_DIR"

    if [ ! -x "/opt/nvim-linux-${NVIM_ARCH}/bin/nvim" ]; then
        echo "Neovim installation failed"
        exit 1
    fi

    echo "Neovim installed successfully at /opt/nvim-linux-${NVIM_ARCH}/bin/nvim"
fi

# Ensure nvim is reachable from user-local PATH.
mkdir -p "$HOME/.local/bin"
if [ -x /opt/nvim-linux-x86_64/bin/nvim ]; then
    ln -sf /opt/nvim-linux-x86_64/bin/nvim "$HOME/.local/bin/nvim"
elif [ -x /opt/nvim-linux-arm64/bin/nvim ]; then
    ln -sf /opt/nvim-linux-arm64/bin/nvim "$HOME/.local/bin/nvim"
elif command -v nvim &> /dev/null; then
    ln -sf "$(command -v nvim)" "$HOME/.local/bin/nvim"
fi

NVIM_CONFIG_DIR="$HOME/.config/nvim"

# Keep existing LazyVim configs on reruns.
if [ -f "$NVIM_CONFIG_DIR/lazyvim.json" ]; then
    echo "LazyVim config already exists at $NVIM_CONFIG_DIR, skipping template install."
    exit 0
fi

if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "Backing up existing Neovim config..."
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
fi

echo "Installing LazyVim starter template..."
git clone https://github.com/LazyVim/starter "$NVIM_CONFIG_DIR"
rm -rf "$NVIM_CONFIG_DIR/.git"

echo "LazyVim installed successfully!"
echo "First run of nvim will install plugins automatically."
