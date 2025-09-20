#!/bin/bash

set -e

echo "Installing tmux and tpm (Tmux Plugin Manager) for macOS..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install Homebrew first."
    echo "Visit: https://brew.sh"
    exit 1
fi

# Install tmux
echo "Installing tmux..."
brew install tmux

# Create tmux directory if it doesn't exist
mkdir -p ~/.tmux/plugins

# Install TPM (Tmux Plugin Manager)
echo "Installing TPM (Tmux Plugin Manager)..."
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "TPM installed successfully!"
else
    echo "TPM is already installed."
fi

echo "Installation complete!"
echo ""
echo "To use TPM:"
echo "1. Add plugins to your tmux.conf file"
echo "2. Press prefix + I (capital i) to install plugins"
echo "3. Press prefix + U to update plugins"
echo "4. Press prefix + alt + u to uninstall plugins"