#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install binaries
brew install \\
  alacritty \\
  eza \\
  fish \\
  fisher \\
  fzf \\
  helix \\
  ripgrep \\
  stow \\
  xplr \\
  zellij \\
  visual-studio-code

# clone dotfiles
mkdir -p $HOME/src/dotfiles
git clone https://github.com/rcalimlim/dotfiles.git $HOME/src/dotfiles
cd $HOME/src/dotfiles
stow --restow -vv -t $HOME -d stow .
