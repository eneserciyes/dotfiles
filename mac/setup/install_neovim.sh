#!/bin/bash

set -e

echo "🚀 Installing Neovim and LazyVim on macOS..."

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew not found. Please install Homebrew first:"
    echo "   /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
    exit 1
fi

# Install Neovim via Homebrew
echo "📦 Installing Neovim..."
brew install neovim

# Verify Neovim installation
if ! command -v nvim &> /dev/null; then
    echo "❌ Neovim installation failed"
    exit 1
fi

echo "✅ Neovim installed successfully"

# Backup existing Neovim config if it exists
NVIM_CONFIG_DIR="$HOME/.config/nvim"
if [ -d "$NVIM_CONFIG_DIR" ]; then
    echo "📁 Backing up existing Neovim config..."
    mv "$NVIM_CONFIG_DIR" "${NVIM_CONFIG_DIR}.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Install LazyVim
echo "🔧 Installing LazyVim..."
git clone https://github.com/LazyVim/starter "$NVIM_CONFIG_DIR"

# Remove the .git directory from the starter template
rm -rf "$NVIM_CONFIG_DIR/.git"

echo "✅ LazyVim installed successfully!"
echo ""
echo "🎉 Setup complete! You can now run 'nvim' to start Neovim with LazyVim."
echo "📝 Config location: $NVIM_CONFIG_DIR"
echo ""
echo "💡 First run will install plugins automatically. This may take a few minutes."