#!/usr/bin/env bash
set -euo pipefail

if command -v nvim &>/dev/null; then
    echo "neovim is already installed."
    exit 0
fi

echo "Installing neovim..."

ARCH=$(uname -m)
case "$ARCH" in
    x86_64) ARCH="x86_64" ;;
    aarch64) ARCH="aarch64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

NVIM_VERSION=$(curl -s https://api.github.com/repos/neovim/neovim/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -Lo /tmp/nvim.tar.gz "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux-${ARCH}.tar.gz"

mkdir -p ~/.local
tar xzf /tmp/nvim.tar.gz -C /tmp
cp -r /tmp/nvim-linux-${ARCH}/* ~/.local/
rm -rf /tmp/nvim-linux-${ARCH} /tmp/nvim.tar.gz

echo "Done. neovim ${NVIM_VERSION} installed to ~/.local/."
