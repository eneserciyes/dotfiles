#!/bin/bash

set -e

echo "Installing TUI tools..."

# fzf, ripgrep, btop from default repos
echo "Installing fzf, ripgrep, btop..."
sudo apt install -y fzf ripgrep btop

# fd-find (installs as fdfind, needs symlink)
echo "Installing fd-find..."
sudo apt install -y fd-find
mkdir -p ~/.local/bin
if [ ! -e ~/.local/bin/fd ]; then
    ln -s "$(which fdfind)" ~/.local/bin/fd
fi

# bat (installs as batcat, needs symlink)
echo "Installing bat..."
sudo apt install -y bat
if [ ! -e ~/.local/bin/bat ]; then
    ln -s "$(which batcat)" ~/.local/bin/bat
fi

# eza via apt repo
echo "Installing eza..."
if ! command -v eza &> /dev/null; then
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg
    sudo chmod 644 /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
fi

# zoxide via install script
echo "Installing zoxide..."
if ! command -v zoxide &> /dev/null; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

# lazygit from GitHub releases
echo "Installing lazygit..."
if ! command -v lazygit &> /dev/null; then
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    ARCH=$(uname -m)
    case "$ARCH" in
        x86_64) LAZYGIT_ARCH="x86_64" ;;
        aarch64|arm64) LAZYGIT_ARCH="arm64" ;;
        *) echo "Unsupported architecture: $ARCH"; exit 1 ;;
    esac
    TEMP_DIR=$(mktemp -d)
    curl -Lo "$TEMP_DIR/lazygit.tar.gz" "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_${LAZYGIT_ARCH}.tar.gz"
    tar xf "$TEMP_DIR/lazygit.tar.gz" -C "$TEMP_DIR"
    sudo install "$TEMP_DIR/lazygit" /usr/local/bin
    rm -rf "$TEMP_DIR"
fi

echo "TUI tools installed successfully!"
