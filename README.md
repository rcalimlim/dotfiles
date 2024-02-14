# dotfiles

## tools
- terminal: `alacritty`
- shell: `fish`
- multiplexer: `zellij`
- file browser: `xplr`
- ls: `eza`
- editor: `helix`
- pkgman: `brew`

## installation
### quick
* `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/rcalimlim/dotfiles/main/install.sh)"`

### manual
* clone this repo into where you want to store it: `git clone https://github.com/rcalimlim/dotfiles`
* cd into the cloned repo: `cd [SOME PATH]/dotfiles`
* create symlinks in $HOME with gnu stow: `stow --restow -vv -t $HOME -d stow .`
* done

