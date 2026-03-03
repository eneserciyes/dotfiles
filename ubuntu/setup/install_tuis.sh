#!/bin/bash

set -euo pipefail

echo "Installing TUI tools (lazygit, lazydocker, btop)..."

sudo apt install -y btop

install_lazygit() {
    if command -v lazygit &> /dev/null; then
        echo "lazygit already installed."
        return
    fi

    local version arch temp_dir
    version="$(curl -s https://api.github.com/repos/jesseduffield/lazygit/releases/latest | grep -Po '"tag_name": "v\K[^"]*')"
    arch="$(uname -m)"
    case "$arch" in
        x86_64) arch="x86_64" ;;
        aarch64|arm64) arch="arm64" ;;
        *) echo "Unsupported architecture for lazygit: $arch"; exit 1 ;;
    esac

    temp_dir="$(mktemp -d)"
    curl -Lo "$temp_dir/lazygit.tar.gz" "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${version}_Linux_${arch}.tar.gz"
    tar xf "$temp_dir/lazygit.tar.gz" -C "$temp_dir"
    sudo install "$temp_dir/lazygit" /usr/local/bin
    rm -rf "$temp_dir"
    echo "lazygit installed."
}

install_lazydocker() {
    if command -v lazydocker &> /dev/null; then
        echo "lazydocker already installed."
        return
    fi

    local version arch temp_dir
    version="$(curl -s https://api.github.com/repos/jesseduffield/lazydocker/releases/latest | grep -Po '"tag_name": "v\K[^"]*')"
    arch="$(uname -m)"
    case "$arch" in
        x86_64) arch="x86_64" ;;
        aarch64|arm64) arch="arm64" ;;
        *) echo "Unsupported architecture for lazydocker: $arch"; exit 1 ;;
    esac

    temp_dir="$(mktemp -d)"
    curl -Lo "$temp_dir/lazydocker.tar.gz" "https://github.com/jesseduffield/lazydocker/releases/latest/download/lazydocker_${version}_Linux_${arch}.tar.gz"
    tar xf "$temp_dir/lazydocker.tar.gz" -C "$temp_dir"
    sudo install "$temp_dir/lazydocker" /usr/local/bin
    rm -rf "$temp_dir"
    echo "lazydocker installed."
}

install_lazygit
install_lazydocker

echo "TUI tools installed successfully!"
