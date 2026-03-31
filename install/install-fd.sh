#!/usr/bin/env bash
set -euo pipefail

if command -v fd &>/dev/null; then
    echo "fd is already installed."
    exit 0
fi

echo "Installing fd-find..."
sudo apt-get update -qq
sudo apt-get install -y fd-find

# Ubuntu ships fd-find as 'fdfind' — create symlink so tools expecting 'fd' work
mkdir -p ~/.local/bin
ln -sf "$(command -v fdfind)" ~/.local/bin/fd
echo "Done. fd installed (symlinked fdfind -> fd)."
