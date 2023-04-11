local wk = require("which-key")

vim.o.timeout = true
vim.o.timeoutlen = 300

wk.setup({})

wk.register({
  ["w"] = { "<cmd>update!<CR>", "Save" },
  ["q"] = { "<cmd>q!<CR>", "Quit" },
  ["t"] = { "<cmd>ToggleTerm <CR>", "open terminal" },

  f = {
    name = "find",
    f = { function() require('telescope.builtin').find_files({ follow = true }) end, "file search" },
    p = { require('telescope').extensions.projects.projects, "project search"},
    g = { require('telescope.builtin').buffer, "buffer search" },
    h = { require('telescope.builtin').help_tags, "help search" },
    e = { "<cmd>NvimTreeToggle <CR>", "file explorer" }
  },

  v = {
    name = "vcs/git",
    s = { "<cmd>Neogit <CR>", "Status" },
    g = {
      name = "github",
      i = {
        name = "Issue",
        s = {"<cmd>Octo issue search<CR>", "Search"},
        c = {"<cmd>Octo issue create <CR>", "Create"},
        e = {"<cmd>Octo issue edit <CR>", "Edit"},
        C = {"<cmd>Octo issue close <CR>", "Close"}
      },
      p = { require('telescope').extensions.gh.pull_request, 'PRs'},
      c = {},
      g = { require('telescope').extensions.gh.gist, 'Gist'}
    }
  },
  p = {
    name = "projects",

  },
  z = {
    name = "plugins",
    i = { "<cmd>PackerInstall<CR>", "Install" },
    u = { "<cmd>PackerUpdate<CR>", "Update" },
    s = { "<cmd>PackerSync<CR>", "Sync" },
    S = { "<cmd>PackerStatus<CR>", "Status" }
  }

}, {
  mode = "n",
  prefix = "<leader>",
})
