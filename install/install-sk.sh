#!/usr/bin/env bash
set -euo pipefail

if command -v sk &>/dev/null; then
    echo "skim (sk) is already installed."
    exit 0
fi

echo "Installing skim (sk)..."

ARCH=$(uname -m)
case "$ARCH" in
    x86_64) ARCH="x86_64-unknown-linux-gnu" ;;
    aarch64) ARCH="aarch64-unknown-linux-gnu" ;;
    *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
esac

SK_VERSION=$(curl -sL https://api.github.com/repos/skim-rs/skim/releases/latest | grep '"tag_name"' | sed -E 's/.*"v([^"]+)".*/\1/')
curl -Lo /tmp/skim.tar.xz "https://github.com/skim-rs/skim/releases/download/v${SK_VERSION}/skim-${ARCH}.tar.xz"

mkdir -p ~/.local/bin
tar xJf /tmp/skim.tar.xz -C /tmp
mv /tmp/skim-${ARCH}/sk ~/.local/bin/sk
rm -rf /tmp/skim.tar.xz /tmp/skim-${ARCH}

echo "Done. skim ${SK_VERSION} installed to ~/.local/bin/."
