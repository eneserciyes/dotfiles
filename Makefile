STOW_DIR := $(HOME)/ws/dotfiles
PACKAGES := btop ghostty git nvim scripts sioyek ssh timewarrior tmux zsh

.PHONY: stow unstow restow install

stow:
	stow -v -d $(STOW_DIR) -t $(HOME) $(PACKAGES)

unstow:
	stow -v -D -d $(STOW_DIR) -t $(HOME) $(PACKAGES)

restow:
	stow -v -R -d $(STOW_DIR) -t $(HOME) $(PACKAGES)

install: stow
	brew bundle --file=$(STOW_DIR)/Brewfile
