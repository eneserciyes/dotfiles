#!/bin/bash

if [[ $# -eq 1 ]]; then
    host=$1
else
		host=$(grep "^Host " ~/.ssh/config | awk '$2 != "*" {print $2}' | sk)
fi

[[ ! $host ]] && exit 0

tmux new-window -n "$host" "ssh $host || (echo 'Press enter to close.' && read)"
