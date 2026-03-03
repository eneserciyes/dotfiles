#!/bin/bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"
SETUP_DIR="$DOTFILES_DIR/ubuntu/setup"

echo "========================================="
echo "  Ubuntu Dev Environment Setup"
echo "========================================="
echo ""
echo "Dotfiles directory: $DOTFILES_DIR"
echo ""

# Phase 1: Base packages and prerequisites
echo "--- Phase 1: Essentials ---"
bash "$SETUP_DIR/install_essentials.sh"

# Phase 2: Desktop apps
echo "--- Phase 2: Desktop Apps ---"
bash "$SETUP_DIR/install_desktop_apps.sh"

# Phase 3: Shell tools, prompt, fonts
echo "--- Phase 3: Shell + Prompt + Fonts ---"
bash "$SETUP_DIR/install_shell_tools.sh"
bash "$SETUP_DIR/install_fonts.sh"

# Phase 4: Development toolchain
echo "--- Phase 4: Development Tools ---"
bash "$SETUP_DIR/install_dev_tools.sh"
bash "$SETUP_DIR/install_gh.sh"
bash "$SETUP_DIR/install_tailscale.sh"

# Phase 5: Neovim
echo "--- Phase 5: Neovim ---"
bash "$SETUP_DIR/install_neovim.sh"

# Phase 6: TUIs and AI CLIs
echo "--- Phase 6: TUIs + AI ---"
bash "$SETUP_DIR/install_tuis.sh"
bash "$SETUP_DIR/install_ai_tools.sh"
bash "$SETUP_DIR/install_tmux.sh"

# Phase 7: Stow configs
echo "--- Phase 7: Stow Configs ---"

# Remove conflicting files
rm -f ~/.gitconfig
rm -f ~/.alias
rm -f ~/.bashrc
rm -rf ~/.config/tmux
rm -rf ~/.config/alacritty
rm -rf ~/.config/Cursor/User
rm -f ~/.ssh/config

# Stow common configs
cd "$DOTFILES_DIR/common"
stow -t ~ git
stow -t ~ alias
stow -t ~ tmux
stow -t ~ alacritty
stow -t ~ cursor
stow -t ~ ssh

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
echo "  2. Open Cursor and verify JetBrains Mono font"
echo "  3. In tmux, press prefix + I to install plugins"
echo "  4. Run 'gh auth login'"
echo "  5. Run 'claude' and 'codex' to authenticate"
echo "  6. Run 'newgrp docker' (or log out/in) for docker group changes"
