#!/bin/bash

# Remove existing ghostty config
rm -rf ~/.config/ghostty

# Stow ghostty from common directory
cd common && stow -t ~ ghostty

# install Neovim LazyNvim customizations
stow -t ~ nvim

# install aliases
stow -t ~ alias

# remove git config and install from here
rm -rf ~/.gitconfig
stow -t ~ git

# remove bashrc and install from here
rm -rf ~/.bashrc
stow -t ~ bash

