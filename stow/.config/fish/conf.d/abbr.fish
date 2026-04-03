#------------------------------------------------------------------------------
# Abbreviations
#------------------------------------------------------------------------------
# clear
abbr --add c clear
abbr --add cl clear

# eza - modern ls
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
abbr --add gpl git pull
abbr --add gr git reset HEAD
abbr --add gu git reset HEAD~1
abbr --add ghd git reset --hard
abbr --add glog git log --graph --decorate --pretty=oneline --abbrev-commit
abbr --add gol /opt/homebrew/bin/go

# zellij
abbr --add z zellij
# abbr --add ztab zellij action new-tab -c \$PWD -l default
