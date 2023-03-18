local builtin = require('telescope.builtin')
require('telescope').setup{
	defaults = {
		mappings = {
			i = {} --whichkey stuff

		},

		pickers = {},
		extesions = {
      media_files = {
        find_cmd = "rg"
      }
    }
	}
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fch', builtin.search_history, {})
