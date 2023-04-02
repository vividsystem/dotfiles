local km = vim.keymap

require("toggleterm").setup({
})

function _G.set_terminal_keymaps()
  km.set('t', '<esc>', "<leader>st", { buffer = 0, desc = "" })
end
