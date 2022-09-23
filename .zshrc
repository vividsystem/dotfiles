# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bullet-train"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export PATH="$PATH:$HOME/.local/bin"
export LUA_INCDR=/usr/include/lua5.4/

fpath+=${ZDOTDIR:-~}/.zsh_functions
