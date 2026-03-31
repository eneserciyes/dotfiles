## Setup

1. Clone: `git clone https://github.com/eneserciyes/oh-my-dot.git ~/ws/oh-my-dot`
2. Install deps: `brew bundle --file=~/ws/oh-my-dot/Brewfile`
3. Create ~/.zshenv bootstrap (only needed on fresh machine before first stow):
   ```
   printf 'ZDOTDIR=~/.config/zsh\n. "$HOME/.local/share/bob/env/env.sh"\n' > ~/.zshenv
   ```
4. Stow everything: `cd ~/ws/oh-my-dot && make stow`
5. macOS settings: `bash ~/ws/oh-my-dot/settings.sh`
6. Bob (neovim): install separately via bob
