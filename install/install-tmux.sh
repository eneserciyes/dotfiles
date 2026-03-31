#!/usr/bin/env bash
set -euo pipefail

TMUX_VERSION="3.6a"

if command -v tmux &>/dev/null; then
    INSTALLED=$(tmux -V | sed 's/tmux //')
    if [ "$INSTALLED" = "$TMUX_VERSION" ]; then
        echo "tmux ${TMUX_VERSION} is already installed."
        exit 0
    fi
    echo "tmux ${INSTALLED} found, upgrading to ${TMUX_VERSION}..."
fi

echo "Installing tmux ${TMUX_VERSION} from source..."

sudo apt-get update -qq
sudo apt-get install -y libevent-dev ncurses-dev build-essential bison pkg-config

curl -Lo /tmp/tmux.tar.gz "https://github.com/tmux/tmux/releases/download/${TMUX_VERSION}/tmux-${TMUX_VERSION}.tar.gz"
tar xzf /tmp/tmux.tar.gz -C /tmp

cd /tmp/tmux-${TMUX_VERSION}
./configure
make -j"$(nproc)"
sudo make install

rm -rf /tmp/tmux-${TMUX_VERSION} /tmp/tmux.tar.gz

echo "Done. tmux ${TMUX_VERSION} installed."
