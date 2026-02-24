#!/bin/bash

set -e

echo "Installing Cursor..."

if command -v cursor &> /dev/null; then
    echo "Cursor is already installed."
    exit 0
fi

# Add Cursor GPG key
curl -fsSL https://downloads.cursor.com/keys/anysphere.asc | sudo gpg --dearmor -o /etc/apt/keyrings/cursor.gpg

# Add Cursor apt repository
echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null

# Install Cursor
sudo apt update
sudo apt install -y cursor

echo "Cursor installed successfully!"
