" All the plugins

call plug#begin('~/.config/nvim/autoload/plugged')
" The Basics
  Plug 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown Preview
  Plug 'jiangmiao/auto-pairs' " Automatical Pairs

  "Visuals
  Plug 'dracula/vim', { 'as': 'dracula' }            " Editor Theme
  Plug 'drewtempelmeyer/palenight.vim'               " Editor Theme 2
  Plug 'vim-airline/vim-airline'                     " The Bars 
  Plug 'vim-airline/vim-airline-themes'              " Themes for the Bars
  Plug 'mhinz/vim-startify'                          " Startscreen
  "{{ File management }}
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}    " Integration for Ranger
  Plug 'scrooloose/nerdtree'                         " Nerdtree
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
  Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
"{{ Productivity/Features }}
  Plug 'vimwiki/vimwiki'                             " VimWiki
  Plug 'tpope/vim-commentary'                        " Commenting stuff out
  Plug 'liuchengxu/vim-which-key'                    " shortcut menu
  Plug 'unblevable/quick-scope'                      " Navigating trough lines FAST
  "{{ Syntax Highlighting and Linting}}
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'vim-python/python-syntax'                    " Python highlighting
  Plug 'ap/vim-css-color'                            " Color previews for CSS
" Junegunn Choi Plugins
  Plug 'junegunn/goyo.vim'                           " Distraction-free viewing
  Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
  Plug 'junegunn/vim-emoji'                          " Vim needs emojis!
  Plug 'junegunn/rainbow_parentheses.vim'            " 
  Plug 'junegunn/fzf'                                " 
  Plug 'junegunn/fzf.vim'                            " 
" Git
  Plug 'mhinz/vim-signify'                           " Git Differences with style
  Plug 'tpope/vim-fugitive' "

call plug#end()

" The config files
source $HOME/.config/nvim/visuals/airline.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/rainbowparant.vim
source $HOME/.config/nvim/plug-config/startify.vim
