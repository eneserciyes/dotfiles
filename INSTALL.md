## Setup

1. Clone: `git clone https://github.com/eneserciyes/dotfiles.git ~/ws/dotfiles`
2. Install deps: `brew bundle --file=~/ws/dotfiles/Brewfile`
3. Create ~/.zshenv bootstrap (only needed on fresh machine before first stow):
   ```
   printf 'ZDOTDIR=~/.config/zsh\n. "$HOME/.local/share/bob/env/env.sh"\n' > ~/.zshenv
   ```
4. Stow everything: `cd ~/ws/dotfiles && make stow`
5. macOS settings: `bash ~/ws/dotfiles/settings.sh`
6. Bob (neovim): install separately via bob
