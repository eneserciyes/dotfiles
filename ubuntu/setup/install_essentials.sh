#!/bin/bash

set -euo pipefail

echo "Installing essential packages..."

sudo apt update
sudo apt upgrade -y

sudo apt install -y \
    build-essential \
    curl \
    wget \
    git \
    stow \
    unzip \
    python3 \
    python3-venv \
    python3-pip \
    software-properties-common \
    ca-certificates \
    gnupg \
    apt-transport-https \
    bash-completion

echo "Essential packages installed successfully!"
