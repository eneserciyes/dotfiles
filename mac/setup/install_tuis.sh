#!/bin/bash

echo "Installing TUI tools..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Error: Homebrew is not installed. Please install Homebrew first."
    exit 1
fi

# Install TUI tools
echo "Installing lazygit..."
brew install lazygit

echo "Installing lazydocker..."
brew install lazydocker

echo "Installing fzf..."
brew install fzf

echo "Installing fd..."
brew install fd

echo "Installing ripgrep..."
brew install ripgrep

echo "Installing btop..."
brew install btop

echo "TUI tools installation complete!"