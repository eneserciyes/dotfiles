alias s='source ~/.config/zsh/.zshrc'
# {{{1 Edit Aliases
alias ez='$EDITOR ~/.config/zsh/.zshrc'
alias ws='cd /Users/enes/ws/'
# }}}

# General aliases
alias ls='eza -lh --group-directories-first --icons=always --no-permissions'
alias diskspace="du -S | sort -n -r |more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"

alias   ..='cd ../'
alias  ...='cd ../../'
alias ....='cd ../../../'
alias   .3='cd ../../../'
alias   .4='cd ../../../../'
alias   .5='cd ../../../../../'
