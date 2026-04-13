#!/usr/bin/env bash
set -euo pipefail

if command -v solaar &>/dev/null; then
    echo "Solaar is already installed."
    exit 0
fi

echo "Installing Solaar..."

TMPDIR=$(mktemp -d)
trap "rm -rf $TMPDIR" EXIT

git clone https://github.com/pwr-Solaar/Solaar.git "$TMPDIR/Solaar"
cd "$TMPDIR/Solaar"

make install_apt
make install_udev
make install_pipx

echo "Done. Solaar installed."
