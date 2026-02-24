#!/bin/bash

set -e

echo "Installing tmux and TPM..."

sudo apt install -y tmux

mkdir -p ~/.tmux/plugins

if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "TPM installed successfully!"
else
    echo "TPM is already installed."
fi

echo "tmux installation complete!"
echo "After starting tmux, press prefix + I to install plugins."
