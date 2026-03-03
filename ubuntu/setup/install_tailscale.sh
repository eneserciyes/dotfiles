#!/bin/bash

set -euo pipefail

echo "Installing Tailscale..."

if command -v tailscale &> /dev/null; then
    echo "Tailscale already installed: $(tailscale version | head -1)"
    exit 0
fi

curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/$(. /etc/os-release && echo "$VERSION_CODENAME").noarmor.gpg | sudo tee /usr/share/keyrings/tailscale-archive-keyring.gpg > /dev/null
curl -fsSL https://pkgs.tailscale.com/stable/ubuntu/$(. /etc/os-release && echo "$VERSION_CODENAME").tailscale-keyring.list | sudo tee /etc/apt/sources.list.d/tailscale.list > /dev/null

sudo apt update
sudo apt install -y tailscale

echo "Tailscale installed successfully!"
echo "Run 'sudo tailscale up' to connect this machine."
