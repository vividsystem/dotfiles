# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="essembeh"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export LUA_INCDR="/usr/include/lua5.4/"
export PNPM_HOME="$HOME/.local/share/pnpm"
export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin/"
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$PNPM_HOME"
export PATH="$PATH:$GOBIN"
export PATH="$PATH:$HOME/.local/share/gem/ruby/3.0.0/bin"

source "$HOME/.cargo/env"
