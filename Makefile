STOW_DIR := $(HOME)/ws/oh-my-dot
PACKAGES := btop claude ghostty git lazygit nvim scripts sioyek ssh timewarrior tmux zsh
UNAME := $(shell uname)

.PHONY: stow unstow restow install

stow:
	stow -v -d $(STOW_DIR) -t $(HOME) $(PACKAGES)

unstow:
	stow -v -D -d $(STOW_DIR) -t $(HOME) $(PACKAGES)

restow:
	stow -v -R -d $(STOW_DIR) -t $(HOME) $(PACKAGES)

install: stow
ifeq ($(UNAME),Darwin)
	brew bundle --file=$(STOW_DIR)/Brewfile
else
	bash $(STOW_DIR)/install/install-all.sh
endif
