#------------------------------------------------------------------------------
# Abbreviations (aliases that expand)
#------------------------------------------------------------------------------
# bat - modern cat
abbr --add cat bat --theme gruvbox-dark

# clear term
abbr --add c clear
abbr --add cl clear
abbr --add cle clear
abbr --add clea clear

# eza - modern ls alternative
abbr --add l eza
abbr --add ll eza --group --group-directories-first --all --icons --width 40
abbr --add lla eza --group --header --group-directories-first --long --all --binary --icons

# git
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

# golang - because I took go
abbr --ad gol /opt/homebrew/bin/go

# xplr - file explorer
abbr --add x xplr

# zellij - terminal multiplexer
abbr --add z zellij attach --create
abbr --add ztab zellij action new-tab -c $PWD -l default
