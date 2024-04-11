#!/bin/bash

# install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install rust (cargo)
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# brew install golang
brew install go # some pkgs need to be installed with go

# taplo for toml config reading
brew install taplo

