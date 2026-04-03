#!/usr/bin/env bash

set -euo pipefail

sudo apt-get update
sudo apt-get install -y tmux zsh git

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
