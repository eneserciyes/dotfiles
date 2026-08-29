#!/bin/bash
# Fuzzy-pick an SSH host from ~/.ssh/config and print it to stdout. The Ctrl-S
# keybinding in bashrc renames the tmux window to the choice and runs ssh.
# Prints nothing / exits non-zero if nothing is picked.

config="$HOME/.ssh/config"
[ -r "$config" ] || exit 1

# Host aliases from the config, minus comments and wildcard patterns.
awk '!/^[[:space:]]*#/ && tolower($1) == "host" {
    for (i = 2; i <= NF; i++)
        if ($i !~ /[*?!]/ && !seen[$i]++) print $i
}' "$config" | fzf --height 40% --reverse --prompt 'ssh> ' \
    --preview 'ssh -G {} 2>/dev/null | grep -iE "^(hostname|user|port) "' \
    --preview-window down,4
