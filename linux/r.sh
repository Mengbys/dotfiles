#!/bin/bash

# apt softwares
# =============
apt install \
	ripgrep \
	fd-find \
	bat \
	tree \
	zsh \
	tmux \


# outside softwares
# 1. nvim
# 2. fzf
# =================
mkdir -p ~/ws/dev_tools
mkdir tmp

wget -P tmp https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz
tar -xzvf tmp/nvim-linux64.tar.gz -C ~/ws/dev_tools

mkdir -p ~/ws/dev_tools/fzf
wget -P tmp https://github.com/junegunn/fzf/releases/download/v0.56.3/fzf-0.56.3-linux_amd64.tar.gz
tar -xzvf tmp/fzf-0.56.3-linux_amd64.tar.gz -C ~/ws/dev_tools/fzf


rm -rf tmp


