local nls = require('null-ls')
local bi = nls.builtins

local sources = {
  bi.formatting.prettierd,
  bi.formatting.shfmt,
  bi.formatting.fixjson,
  bi.formatting.black.with { extra_args = { "--fast" } },
  bi.formatting.isort,

  bi.diagnostics.write_good,
  bi.diagnostics.tsc,

  bi.code_actions.gitsigns,
  bi.code_actions.gitrebase,
  bi.code_actions.refactoring,
}

nls.setup({
  sources = sources
})
