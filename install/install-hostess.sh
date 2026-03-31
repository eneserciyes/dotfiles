#!/usr/bin/env bash
set -euo pipefail

if command -v hostess &>/dev/null; then
    echo "hostess is already installed."
    exit 0
fi

echo "Installing hostess..."

ARCH=$(uname -m)
case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64) ARCH="arm64" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

HOSTESS_VERSION=$(curl -s https://api.github.com/repos/cbednarski/hostess/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -Lo ~/.local/bin/hostess "https://github.com/cbednarski/hostess/releases/download/v${HOSTESS_VERSION}/hostess_linux_${ARCH}"

mkdir -p ~/.local/bin
chmod +x ~/.local/bin/hostess

echo "Done. hostess ${HOSTESS_VERSION} installed to ~/.local/bin/."
