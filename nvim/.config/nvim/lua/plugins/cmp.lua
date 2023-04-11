local cmp = require 'cmp'

local snippy = require 'snippy'

cmp.setup {
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered()
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'treesitter'},
    { name = 'buffer' },
    { name = 'nvim_lua' },
    { name = 'path'}
  },
}
