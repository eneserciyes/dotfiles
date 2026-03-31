#!/usr/bin/env bash
set -euo pipefail

if command -v lazygit &>/dev/null; then
    echo "lazygit is already installed."
    exit 0
fi

echo "Installing lazygit..."

ARCH=$(uname -m)
case "$ARCH" in
    x86_64) ARCH="x86_64" ;;
    aarch64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

LAZYGIT_VERSION=$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -Lo /tmp/lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_${ARCH}.tar.gz"

mkdir -p ~/.local/bin
tar xzf /tmp/lazygit.tar.gz -C /tmp lazygit
mv /tmp/lazygit ~/.local/bin/lazygit
rm /tmp/lazygit.tar.gz

echo "Done. lazygit ${LAZYGIT_VERSION} installed to ~/.local/bin/."
