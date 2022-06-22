# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# dotfiles are cloned to a bare repo and working tree is home dir
# interact with it using `config`
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no

# set nvim as default editor for system
export VISUAL=nvim
export EDITOR="$VISUAL"

# prompt style
prompt cloud '>' 'yellow' 'red'

# aliases
alias ll="gls -1shAX --color=auto --group-directories-first"
alias ga="git add"
alias gap="git add -p"
alias gs="git status"
alias gc="git commit"
alias go="git checkout"
alias gb="git branch"
alias gd="git diff"
alias gp="git push"
alias gr="git reset head"
alias gh="git log --graph --decorate --pretty=oneline --abbrev-commit"

# custom homebrew for meta
export PATH="$HOME/homebrew/bin:$HOME/homebrew/sbin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
