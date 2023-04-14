local km = vim.keymap

local default_opts = {
  noremap = true,
  silent = true
}

local add_desc = function(desc)
  local opts = default_opts
  opts['desc'] = desc
  return opts
end

km.set('n', '<C-f>', '/')

km.set('n', '<Up>', '<Nop>', default_opts)
km.set('n', '<Down>', '<Nop>', default_opts)
km.set('n', '<Left>', '<Nop>', default_opts)
km.set('n', '<Right>', '<Nop>', default_opts)

km.set('n', '<C-J>', ':bprev<CR>', add_desc('change to next buffer')) --> fix interference with nvimtree
km.set('n', '<C-K>', ':bnext<CR>', add_desc('change to previous buffer'))

km.set('i', "jk", "<ESC>", add_desc('ESC'))
km.set('t', 'jk', '<C-\\><C-n>', add_desc('ESC'))


