local km = vim.keymap

local default_opts = {
  noremap = true,
  silent = true
}

km.set('n', '<C-f>', '/')

km.set('n', '<Up>', '<Nop>', default_opts)
km.set('n', '<Down>', '<Nop>', default_opts)
km.set('n', '<Left>', '<Nop>', default_opts)
km.set('n', '<Right>', '<Nop>', default_opts)

km.set('n', '<C-J>', ':bprev<CR>', default_opts) --> fix interference with nvimtree
km.set('n', '<C-K>', ':bnext<CR>', default_opts)

km.set('i', "jk", "<ESC>", default_opts)
km.set('t', 'jk', '<C-\\><C-n>', default_opts)


