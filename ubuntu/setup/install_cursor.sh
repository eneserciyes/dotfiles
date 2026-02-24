#!/bin/bash

set -e

echo "Installing Cursor..."

if command -v cursor &> /dev/null; then
    echo "Cursor is already installed."
    exit 0
fi

TEMP_DIR=$(mktemp -d)
curl -L -o "$TEMP_DIR/cursor.appimage" "https://www.cursor.com/api/download?platform=linux-x64&releaseTrack=stable"
chmod +x "$TEMP_DIR/cursor.appimage"

mkdir -p ~/.local/bin
mv "$TEMP_DIR/cursor.appimage" ~/.local/bin/cursor
rm -rf "$TEMP_DIR"

# Create desktop entry
mkdir -p ~/.local/share/applications
cat > ~/.local/share/applications/cursor.desktop << 'EOF'
[Desktop Entry]
Name=Cursor
Exec=cursor --no-sandbox %F
Type=Application
Icon=cursor
Categories=Development;IDE;
MimeType=text/plain;
StartupWMClass=Cursor
EOF

echo "Cursor installed successfully!"
echo "Run 'cursor' to launch."
