#!/bin/bash

set -euo pipefail

echo "Installing desktop apps (Chrome, Alacritty, Obsidian, Spotify, Cursor)..."

install_chrome() {
    if command -v google-chrome &> /dev/null; then
        echo "Chrome already installed."
        return
    fi

    local temp_dir
    temp_dir="$(mktemp -d)"
    curl -fsSL -o "$temp_dir/google-chrome.deb" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y "$temp_dir/google-chrome.deb"
    rm -rf "$temp_dir"
    echo "Chrome installed."
}

install_alacritty() {
    if command -v alacritty &> /dev/null; then
        echo "Alacritty already installed."
        return
    fi

    sudo apt install -y alacritty
    echo "Alacritty installed."
}

install_obsidian() {
    if command -v obsidian &> /dev/null; then
        echo "Obsidian already installed."
        return
    fi

    if ! command -v snap &> /dev/null; then
        sudo apt install -y snapd
    fi

    sudo snap install obsidian --classic
    echo "Obsidian installed."
}

install_spotify() {
    if command -v spotify &> /dev/null; then
        echo "Spotify already installed."
        return
    fi

    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor -o /etc/apt/keyrings/spotify.gpg
    echo "deb [signed-by=/etc/apt/keyrings/spotify.gpg] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null
    sudo apt update
    sudo apt install -y spotify-client
    echo "Spotify installed."
}

install_cursor() {
    if command -v cursor &> /dev/null; then
        echo "Cursor already installed."
        return
    fi

    curl -fsSL https://downloads.cursor.com/keys/anysphere.asc | sudo gpg --dearmor -o /etc/apt/keyrings/cursor.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/cursor.gpg] https://downloads.cursor.com/aptrepo stable main" | sudo tee /etc/apt/sources.list.d/cursor.list > /dev/null
    sudo apt update
    sudo apt install -y cursor
    echo "Cursor installed."
}

install_chrome
install_alacritty
install_obsidian
install_spotify
install_cursor

echo "Desktop apps installed successfully."
