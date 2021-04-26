call plug#begin('~/.config/nvim/autoload/plugged')
"{{ The Basics }}
  Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
  Plug 'frazrepo/vim-rainbow'
  Plug 'jiangmiao/auto-pairs'
"The Visuals
  Plug 'dracula/vim', { 'as': 'dracula' } " Editor Theme
  Plug 'vim-airline/vim-airline' " The Bars 
  Plug 'vim-airline/vim-airline-themes' " Themes for the Bars
"  Plug 'norcalli/nvim-colorizer.lua' " Color Value Colorizer
  Plug 'mhinz/vim-startify'
"{{ File management }}
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  Plug 'scrooloose/nerdtree'                         " Nerdtree
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
  Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
  Plug 'airblade/vim-rooter'
  Plug 'jremmen/vim-ripgrep'
"{{ Productivity/Features }}
  Plug 'vimwiki/vimwiki'                             " VimWiki
  Plug 'tpope/vim-commentary'
  Plug 'liuchengxu/vim-which-key'
  Plug 'unblevable/quick-scope'
"{{ Syntax Highlighting and Linting}}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-python/python-syntax'                    " Python highlighting
  Plug 'ap/vim-css-color'                            " Color previews for CSS
" Junegunn Choi Plugins
  Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
  Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
  Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
  Plug 'junegunn/rainbow_parentheses.vim'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
" Git the fuck out lol
  Plug 'mhinz/vim-signify'
  Plug 'tpope/vim-fugitive'

call plug#end()
source $HOME/.config/nvim/visuals/airline.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/rainbowparant.vim
source $HOME/.config/nvim/plug-config/startify.vim
