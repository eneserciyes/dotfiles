#!/usr/bin/env bash
set -euo pipefail

if command -v fzf &>/dev/null; then
    echo "fzf is already installed."
    exit 0
fi

echo "Installing fzf..."

ARCH=$(uname -m)
case "$ARCH" in
    x86_64) ARCH="linux_amd64" ;;
    aarch64) ARCH="linux_arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

FZF_VERSION=$(curl -sL https://api.github.com/repos/junegunn/fzf/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -Lo /tmp/fzf.tar.gz "https://github.com/junegunn/fzf/releases/download/v${FZF_VERSION}/fzf-${FZF_VERSION}-${ARCH}.tar.gz"

mkdir -p ~/.local/bin
tar xzf /tmp/fzf.tar.gz -C ~/.local/bin fzf
rm /tmp/fzf.tar.gz

echo "Done. fzf ${FZF_VERSION} installed to ~/.local/bin/."
