#------------------------------------------------------------------------------
# Fish general conf
#------------------------------------------------------------------------------
# shell - brew dir differs between x86 and Apple Silicon
if test "/opt/homebrew/bin/fish"
    set -g SHELL /opt/homebrew/bin/fish
else if test "usr/local/bin/fish"
    set -g SHELL /usr/local/bin/fish
end

# theme
fish_config theme choose none

# non-ui mac config options
# disables long press key to show alternative letters
defaults write -g ApplePressAndHoldEnabled -bool false 

#------------------------------------------------------------------------------
# Interactive session only
#------------------------------------------------------------------------------
if status is-interactive
    # Commands to run in interactive sessions can go here

    # zellij terminal multiplexer auto attach on start
    set ZELLIJ_AUTO_ATTACH true
    # zellij attach --create
end

