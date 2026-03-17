#------------------------------------------------------------------------------
# PATH
#------------------------------------------------------------------------------
fish_add_path /opt/homebrew/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.n/bin
fish_add_path $HOME/.local/bin
fish_add_path (go env GOPATH)/bin
