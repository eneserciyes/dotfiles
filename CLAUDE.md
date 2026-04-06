- Dotfiles repo lives at ~/ws/oh-my-dot, managed with GNU stow
- zshrc and zshenv are stowed directly to ~/.zshrc and ~/.zshenv
- Scripts are stowed to ~/.local/scripts/ (in PATH via .zshrc)
- To apply changes after editing: cd ~/ws/oh-my-dot && make restow
- tmux copy mode: `copy-selection` clears the selection but stays in copy mode. `copy-selection-and-cancel` copies and exits copy mode. They are NOT the same.

- Installing for Ubuntu is inside './install/' and installing for Mac is with brew and './Brewfile'
When you add/remove new installations, add/remove them for both Ubuntu and Mac.
Always add/remove the script entry in `install/install-all.sh` as well.
