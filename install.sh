#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install binaries
brew install \
  alacritty \
  corepack \
  eza \
  fish \
  fisher \
  fzf \
  helix \
  node \
  ripgrep \
  sql-language-server \
  stow \
  vue-language-server \
  yarn \
  xplr \
  zellij \
  visual-studio-code

# clone dotfiles
mkdir -p $HOME/src/dotfiles
git clone https://github.com/rcalimlim/dotfiles.git $HOME/src/dotfiles
cd $HOME/src/dotfiles
stow --restow -vv -t $HOME -d stow .

# use modern yarn
yarn set version berry

# install helix lsps
pnpm i -g \
  dockerfile-language-server-nodejs \
  graphql-language-service-cli \
  svelte-language-server \
  typescript \
  typescript-language-server \
  vls

brew install \
  bash-language-server \
  gopls \
  llvm \
  lua-language-server \
  marksman \
  pnpm \
  stow \
  taplo \
  tree-sitter \
  vscode-langservers-extracted \
  yaml-language-server \
  zls

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # rust

# fish shell plugins managed by fisher
fisher install pure-fish/pure
