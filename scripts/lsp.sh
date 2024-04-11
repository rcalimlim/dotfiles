#!/bin/bash

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
  taplo \
  tree-sitter \
  vscode-langservers-extracted \
  vue-language-server \
  yaml-language-server \
  zls

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh # rust

# fish shell plugins managed by fisher
fisher install pure-fish/pure
