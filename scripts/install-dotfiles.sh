#!/bin/bash

# install dotfiles
git clone --bare https://github.com/rcalimlim/dotfiles $HOME/.dotfiles
function config {
   /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no

# set shell to zsh
zsh

# prezto (zsh config framework)
# install prezto
git clone --recursive \
    https://github.com/sorin-ionescu/prezto.git \
    "${ZDOTDIR:-$HOME}/.zprezto"

# copy prezto configs
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

# set theme to powerline
prompt cloud '>' 'yellow' 'red'

# clone kitty themes
git clone https://github.com/dexpota/kitty-themes.git .config/kitty-themes
