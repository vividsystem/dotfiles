let g:startify_session_dir = '~/.config/nvim/plug-config/session'
let g:startify_lists = [
          \ {   'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

let g:startify_bookmarks = [
            \ { 'z': '~/.zshrc' },
            \ { 'a': '~/.config/autofile' },
            \ '~/.config/nvim/',                  
            \ '~/Documents',
            \ '~/Developer/Code/Projects',
            \ '~/.dotfiles',
            \ ]

let g:startify_custom_header = [
  \'        _       _     _               _                  ',                
  \'       (_)     (_)   | |             | |                 ',               
  \' __   _____   ___  __| |___ _   _ ___| |_ ___ _ __ ___   ', 
  \' \ \ / / \ \ / / |/ _` / __| | | / __| __/ _ \  _ ` _ \  ',
  \'  \ V /| |\ V /| | (_| \__ \ |_| \__ \ ||  __/ | | | | | ',
  \'   \_/ |_| \_/ |_|\__,_|___/\__, |___/\__\___|_| |_| |_| ',
  \'                             __/ |                       ',
  \'                            |___/                        ',
  \]
