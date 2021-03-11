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
        \ '   _  __     _         __  ___         __     ___ ',
        \ '  / |/ /  __(_)_ _    /  |/  /__ _____/ /    |_  |',
        \ ' /    / |/ / /  ` \  / /|_/ / _ `/ __/ _ \  / __/ ',
        \ '/_/|_/|___/_/_/_/_/ /_/  /_/\_,_/\__/_//_/ /____/ ',
        \]
