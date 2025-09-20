#!/bin/bash

echo "Installing CaskaydiaMono Nerd Font..."

# Create temporary directory for the installation
TEMP_DIR=$(mktemp -d)
cd "$TEMP_DIR"

# Download CascadiaMono Nerd Font
echo "Downloading CascadiaMono Nerd Font..."
curl -L -o CascadiaMono.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/CascadiaMono.zip

# Extract the font files
echo "Extracting font files..."
unzip -q CascadiaMono.zip

# Install fonts to user's font directory
FONT_DIR="$HOME/Library/Fonts"
echo "Installing fonts to $FONT_DIR..."

# Copy all .ttf and .otf files to the font directory
find . -name "*.ttf" -o -name "*.otf" | while read -r font; do
    cp "$font" "$FONT_DIR/"
    echo "Installed: $(basename "$font")"
done

# Clean up
cd /
rm -rf "$TEMP_DIR"

echo "CaskaydiaMono Nerd Font installation complete!"

