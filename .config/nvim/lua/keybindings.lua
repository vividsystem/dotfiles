local km = vim.keymap

km.set('n', '<C-f>', '/')

km.set('n', '<Up>', '<Nop>')
km.set('n', '<Down>', '<Nop>')
km.set('n', '<Right>', '<Nop>')

km.set('n', '<C-J>', ':bprev<CR>') --> fix interference with nvimtree
km.set('n', '<C-K>', ':bnext<CR>')

km.set('n', '<leader>nt', ':NvimTreeToggle <CR>')
