ZSH_DISABLE_COMPFIX=true
export ZSH=$HOME/.oh-my-zsh

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="bullet-train"
#agnoster, af-magic, powerlevel10k, bullet-train, robbyrussell

DISABLE_AUTO_TITLE="true"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/

plugins=(
git
zsh-autosuggestions
zsh-completions
profiles
)

source $ZSH/oh-my-zsh.sh


#Pathes
#path+=('~/.nvim-osx64/nvim/bin')
#export PATH="$PATH:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin"
#export PATH="$PATH:$HOME/Developer/flutter/bin"
export PATH=$PATH:$HOME/.bin/gradle/gradle-6.8/bin
export PATH=$PATH:$HOME/.deno/bin/
export PATH=$PATH:$HOME/.bin/lolcat/bin/
export PATH=$PATH:$HOME/.emacs.d/bin
export PATH=$PATH:$HOME/.nvim-osx64/bin/
export PATH=$PATH:$HOME/.opt/bettercap
export PATH=$PATH:$HOME/.config/shell-color-scripts
export PATH=$PATH:$HOME/Developer/Code/Projects/autoFile/
export PATH=$PATH:$HOME/.bin/chromedriver/
export PATH=$PATH:$HOME/Developer/Code/Projects/autofile/
#export PATH=$PATH:$HOME/.opt/ImageMagick-7.0.10/bin/
export DOOMDIR=$HOME/.config/doom
export GOPATH=$HOME/.go
export GOBIN=$HOME/.go/bin
#alias colorscript="sh /Users/mateostiller/.config/shell-color-scripts/colorscript.sh"

#Alias
source ~/.config/zsh/aliases.zsh
source ~/.config/zsh/funcs.zsh
echo ""
echo "zsh ready. coding ready. hacking ready."
echo ""
alias virtualenv="python3 -m virtualenv"

colorscript random

echo "\nvividsystem - the vivid developer\n" | lolcat --spread=1 --freq=.3 -a --duration=15

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
