# shell - brew dir differs between x86 and Apple Silicon
if test "/opt/homebrew/bin/fish"
    set -g SHELL /opt/homebrew/bin/fish
else if test "usr/local/bin/fish"
    set -g SHELL /usr/local/bin/fish
end

# theme
fish_config theme choose none


# path
fish_add_path /bin
fish_add_path /sbin
fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/opt/llvm/bin
fish_add_path /opt/pkg/bin
fish_add_path /opt/pkg/sbin
fish_add_path /opt/X11/bin
fish_add_path /usr/bin
fish_add_path /usr/sbin
fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin
fish_add_path /usr/local/texlive/2023/bin/universal-darwin/ # latex
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $HOME/.local/bin

# abbreviations
abbr --add ga git add
abbr --add gap git add -p
abbr --add gs git status
abbr --add gc git commit
abbr --add go git checkout
abbr --add gb git branch
abbr --add gd git diff
abbr --add gp git push
abbr --add gr git reset head
abbr --add glog git log --graph --decorate --pretty=oneline --abbrev-commit
abbr --add ghd git reset --hard
abbr --add gu git reset HEAD~1
abbr --add x xplr
abbr --add z zellij

# eza (ls) abbr
abbr --add l eza
abbr --add ll eza --group --header --group-directories-first --long --all --binary --icons

# editor
set -Ux EDITOR hx

# vi bindings
set -g fish_key_bindings fish_vi_key_bindings

if status is-interactive
    # Commands to run in interactive sessions can go here

    # Configure auto-attach/exit to your likings (default is off).
    # set ZELLIJ_AUTO_ATTACH true
    # set ZELLIJ_AUTO_EXIT false
    # eval (zellij setup --generate-auto-start fish | string collect)
end

