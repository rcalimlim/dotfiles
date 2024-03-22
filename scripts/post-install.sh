#!/bin/bash

# clone dotfiles
mkdir -p "$HOME"/src/dotfiles
git clone https://github.com/rcalimlim/dotfiles.git "$HOME"/src/dotfiles
cd "$HOME"/src/dotfiles || exit
git submodule update --init --recursive
stow --restow -vv -t "$HOME" -d stow .

# use modern yarn
# yarn set version berry
