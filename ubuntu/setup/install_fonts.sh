#!/bin/bash

set -e

echo "Installing CascadiaMono Nerd Font..."

TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

echo "Downloading CascadiaMono Nerd Font..."
curl -L -o CascadiaMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip

echo "Extracting font files..."
unzip -q CascadiaMono.zip

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

echo "Installing fonts to $FONT_DIR..."
find . -name "*.ttf" -o -name "*.otf" | while read -r font; do
    cp "$font" "$FONT_DIR/"
    echo "Installed: $(basename "$font")"
done

cd /
rm -rf "$TEMP_DIR"

echo "Rebuilding font cache..."
fc-cache -fv

echo "CascadiaMono Nerd Font installed successfully!"
