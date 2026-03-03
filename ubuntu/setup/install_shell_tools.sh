#!/bin/bash

set -euo pipefail

echo "Installing shell tools (fzf, zoxide, ripgrep, fd, eza, bat, starship)..."

sudo apt install -y fzf ripgrep fd-find bat

mkdir -p ~/.local/bin
if [ ! -e ~/.local/bin/fd ] && command -v fdfind &> /dev/null; then
    ln -s "$(which fdfind)" ~/.local/bin/fd
fi
if [ ! -e ~/.local/bin/bat ] && command -v batcat &> /dev/null; then
    ln -s "$(which batcat)" ~/.local/bin/bat
fi

if ! command -v zoxide &> /dev/null; then
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh
fi

if ! command -v eza &> /dev/null; then
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list > /dev/null
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg
    sudo chmod 644 /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
fi

if ! command -v starship &> /dev/null; then
    curl -sS https://starship.rs/install.sh | sh -s -- -y
fi

echo "Shell tools installed successfully."
