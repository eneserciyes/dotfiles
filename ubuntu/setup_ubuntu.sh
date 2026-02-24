#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SETUP_DIR="$DOTFILES_DIR/ubuntu/setup"

echo "========================================="
echo "  Ubuntu Dev Environment Setup"
echo "========================================="
echo ""
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# Phase 1: Essentials + Node.js
echo "--- Phase 1: Essentials + Node.js ---"
bash "$SETUP_DIR/install_essentials.sh"
bash "$SETUP_DIR/install_node.sh"

# Phase 2: Dev tools (independent of each other)
echo "--- Phase 2: Dev Tools ---"
bash "$SETUP_DIR/install_neovim.sh"
bash "$SETUP_DIR/install_tmux.sh"
bash "$SETUP_DIR/install_tuis.sh"
bash "$SETUP_DIR/install_gh.sh"
bash "$SETUP_DIR/install_fonts.sh"
bash "$SETUP_DIR/install_cursor.sh"

# Phase 3: AI tools (depends on Node.js)
echo "--- Phase 3: AI Tools ---"
bash "$SETUP_DIR/install_ai_tools.sh"

# Phase 4: Keyboard remap
echo "--- Phase 4: Keyboard ---"
bash "$SETUP_DIR/install_capslock_ctrl.sh"

# Phase 5: Stow configs
echo "--- Phase 5: Stow Configs ---"

# Remove conflicting files
rm -f ~/.gitconfig
rm -f ~/.alias
rm -f ~/.bashrc
rm -rf ~/.config/ghostty
rm -rf ~/.config/tmux

# Stow common configs
cd "$DOTFILES_DIR/common"
stow -t ~ git
stow -t ~ alias
stow -t ~ nvim
stow -t ~ tmux
stow -t ~ ghostty

# Stow ubuntu-specific configs (overrides common)
cd "$DOTFILES_DIR/ubuntu"
stow -t ~ bash

echo ""
echo "========================================="
echo "  Setup Complete!"
echo "========================================="
echo ""
echo "Next steps:"
echo "  1. source ~/.bashrc"
echo "  2. Open nvim - LazyVim will install plugins on first run"
echo "  3. In tmux, press prefix + I to install plugins"
echo "  4. Run 'gh auth login' to authenticate GitHub CLI"
echo "  5. Run 'claude' to authenticate Claude Code"
echo "  6. Log out and back in for Caps Lock -> Ctrl to take effect"
