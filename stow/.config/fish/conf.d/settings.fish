#------------------------------------------------------------------------------
# General
#------------------------------------------------------------------------------
set -g fish_greeting
set -gx EDITOR hx
set -gx SHELL /opt/homebrew/bin/fish
set -g fish_key_bindings fish_vi_key_bindings
set -g fish_term24bit 1

# man - use bat as colorizing pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# n - node version manager
set -gx N_PREFIX $HOME/.n

#------------------------------------------------------------------------------
# Theme
#------------------------------------------------------------------------------
fish_config theme choose 'Base16 Default Dark'
