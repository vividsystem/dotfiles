ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bullet-train"
#agnoster, af-magic, powerlevel10k, bullet-train, robbyrussell

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
git
zsh-autosuggestions
zsh-completions
profiles
)

source $ZSH/oh-my-zsh.sh


#Exports
export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin

#Alias
source ~/.config/sh/aliases.sh
source ~/.config/sh/scripts.sh

alias virtualenv="python3 -m virtualenv"
[ colorscript ] && colorscript random


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
