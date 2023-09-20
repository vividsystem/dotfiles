# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bullet-train"

plugins=(git)

export CUSTONVIM="$HOME/.config/custonvim"
alias cnv="XDG_CONFIG_HOME=$CUSTONVIM XDG_CACHE_HOME=$CUSTONVIM XDG_DATA_HOME=$CUSTONVIM/share nvim"
source $ZSH/oh-my-zsh.sh

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export PATH="$PATH:$HOME/.local/bin"
export LUA_INCDR="/usr/include/lua5.4/"

export PNPM_HOME="/home/ms/.local/share/pnpm"
export PATH="$PATH:$PNPM_HOME"

export GOPATH="$HOME/.go"
export PATH="$PATH:$HOME/.go/bin"

export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

source "$HOME/.cargo/env"
