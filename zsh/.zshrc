# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="bullet-train"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export GTK_THEME=Adwaita:dark
GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc

export PATH="$PATH:$HOME/.local/bin"
export LUA_INCDR=/usr/include/lua5.4/

fpath+=${ZDOTDIR:-~}/.zsh_functions
export PNPM_HOME=/home/ms/.local/share/pnpm
case :/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ms/.local/bin:/home/ms/.local/bin: in
  *::*) ;;
  *) export PATH=:/sbin:/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/sbin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/home/ms/.local/bin:/home/ms/.local/bin ;;
esac
