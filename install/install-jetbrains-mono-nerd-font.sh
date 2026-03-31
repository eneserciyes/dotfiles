#!/usr/bin/env bash
set -euo pipefail

FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"
FONT_DIR="$HOME/.local/share/fonts/JetBrainsMono"
TMP_ZIP="/tmp/JetBrainsMono.zip"

if fc-list | grep -qi "JetBrainsMono"; then
    echo "JetBrains Mono Nerd Font is already installed."
    exit 0
fi

echo "Downloading JetBrains Mono Nerd Font..."
wget -q --show-progress -O "$TMP_ZIP" "$FONT_URL"

echo "Installing to $FONT_DIR..."
mkdir -p "$FONT_DIR"
unzip -o "$TMP_ZIP" -d "$FONT_DIR"
rm "$TMP_ZIP"

echo "Refreshing font cache..."
fc-cache -fv

echo "Done. Installed fonts:"
fc-list | grep "JetBrainsMono"
