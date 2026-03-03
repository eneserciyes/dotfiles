#!/bin/bash

set -euo pipefail

echo "Installing JetBrainsMono Nerd Font..."

TEMP_DIR="$(mktemp -d)"
cd "$TEMP_DIR"

curl -fsSL -o JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip -q JetBrainsMono.zip

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

find . \( -name "*.ttf" -o -name "*.otf" \) -type f -exec cp {} "$FONT_DIR/" \;

cd /
rm -rf "$TEMP_DIR"

fc-cache -fv

echo "JetBrainsMono Nerd Font installed successfully!"
