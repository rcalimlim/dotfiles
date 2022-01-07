#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# load statusline
autoload -Uz promptinit
promptinit
prompt powerlevel10k

# aliases - listing
alias ll="gls -alh --color --group-directories-first | awk '{print \$5,\$9}' | column -t"
alias lsr="tree -L 3 -I node_modules"

# aliases - git
alias ga="git add"
alias gap="git add -p"
alias gs="git status"
alias gc="git commit"
alias go="git checkout"
alias gd="git diff"
alias gp="git push"
alias gr="git reset head"
alias gh="git log --graph --decorate --pretty=oneline --abbrev-commit"
