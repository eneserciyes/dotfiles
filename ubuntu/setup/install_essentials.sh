#!/bin/bash

set -e

echo "Installing essential packages..."

sudo apt update && sudo apt upgrade -y

sudo apt install -y \
    build-essential \
    curl \
    wget \
    git \
    stow \
    unzip \
    software-properties-common \
    ca-certificates \
    gnupg \
    cmake \
    gettext

echo "Essential packages installed successfully!"
