ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="bullet-train"

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(
git
zsh-syntax-highlighting
profiles
)

source $ZSH/oh-my-zsh.sh


export DOOMDIR=$HOME/.config/doom
export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
