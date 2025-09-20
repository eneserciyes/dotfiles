#!/bin/bash

# Install zsh if not already installed
if ! command -v zsh &> /dev/null; then
    echo "Installing zsh..."
    brew install zsh
else
    echo "zsh is already installed"
fi

# Set zsh as default shell
echo "Setting zsh as default shell..."
if [[ "$SHELL" != "/bin/zsh" ]] && [[ "$SHELL" != "/usr/local/bin/zsh" ]]; then
    sudo chsh -s /bin/zsh $USER
    echo "Default shell changed to zsh"
else
    echo "zsh is already the default shell"
fi

# Install oh-my-zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing oh-my-zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    echo "oh-my-zsh installed successfully"
else
    echo "oh-my-zsh is already installed"
fi