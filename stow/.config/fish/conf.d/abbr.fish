#------------------------------------------------------------------------------
# Abbreviations (aliases that expand)
#------------------------------------------------------------------------------
# clear term
abbr --add c clear

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

# volta - node/yarn manager
abbr --add volta-node 'volta install node@$(cat package.json | jq --raw-output .volta.node)'
abbr --add volta-yarn 'volta install yarn@$(cat package.json | jq --raw-output .volta.yarn)'

# xplr - file explorer
abbr --add x xplr

# zellij - terminal multiplexer
abbr --add z zellij -l default
abbr --add ztab zellij action new-tab
