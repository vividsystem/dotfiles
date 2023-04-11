local fn = vim.fn
local cmd = vim.cmd

cmd([[packadd packer.nvim]])

cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local ensure_packer = function()
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function (use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-web-devicons'

	--------------------
	--++   Themes   ++--
	--------------------
	use {
		'marko-cerovac/material.nvim',
		config = function() require("plugins.material") end
	}

  use {
    'Shatur/neovim-ayu',
    config = function() require('plugins.ayu') end
  }


	------------------
	--++ Features ++--
	------------------
	-- Start Screens
  use {
    'glepnir/dashboard-nvim',
    event = 'VimEnter',
    config = function() require("plugins.dashboard") end
  }
	--Statusline
	use {
  	'nvim-lualine/lualine.nvim',
		config = function() require("plugins.lualine") end
	}
	--Tabbar
	use {
		'romgrk/barbar.nvim',
		config = function() require("plugins.barbar") end,
		requires = 'nvim-web-devicons'
	}

	--File Explorer
	use {
  	'nvim-tree/nvim-tree.lua',
		config = function() require("plugins.nvim-tree") end
		}
	-- Project Manager
	use {
  	"ahmedkhalf/project.nvim",
  	config = function() require("plugins.project") end,
	}
	-- Fuzzy Finder
	use {
  	'nvim-telescope/telescope.nvim', tag = '0.1.1',
  	config = function() require("plugins.telescope") end,
    requires = {
      'nvim-telescope/telescope-media-files.nvim',
      "nvim-telescope/telescope-github.nvim"
    }
	}

  -- Terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function() require("plugins.toggleterm")	end
	}
  ------------------
  --++   Git    ++--
  ------------------
	use {
		'TimUntersberger/neogit',
		config = function() require("plugins.neogit") end
	}

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    'f-person/git-blame.nvim',
    config = function() require("plugins.git-blame") end
  }

	-- Github Implementation
	use {
  	'pwntester/octo.nvim',
		config = function() require("plugins.octo") end
	}

  use {
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  }

  ------------------
  --++   QOL    ++--
  ------------------
  use {
    "Pocco81/auto-save.nvim",
    config = function() require("plugins.auto-save") end
  }
	-- simple but powerful autopairs implementation
	use {
		"windwp/nvim-autopairs",
    config = function() require("plugins.nvim-autopairs") end
	}

  use {
    "windwp/nvim-ts-autotag"
  }
	-- simple cheat sheet
	use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
  	}
	}
	-- syntax highlighting
	use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.nvim-treesitter') end
  }
	use { -- highlights color strings
		'uga-rosa/ccc.nvim',
		config = function() require("plugins.ccc") end,
	}

  use {
    'renerocksai/telekasten.nvim',
    config = function() require("plugins.telekasten") end
  }

  ------------------
	--++   LSP    ++--
  ------------------
  use {
    "williamboman/mason.nvim",
    config = function() require('plugins.mason') end,
    requires = {
      "williamboman/mason-lspconfig.nvim"
    }
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end,
    requires = {
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()  require('plugins.null-ls') end
      }
    }
  }

  use "folke/neodev.nvim" -- neovim lua support
  use 'nanotee/sqls.nvim' -- sql
  use {
    'ray-x/go.nvim',
    config = function() require('plugins.go') end,
    requires = 'ray-x/guihua.lua'
  }



  use { --completion
    'hrsh7th/nvim-cmp',
    config = function() require('plugins.cmp') end,
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      {'dcampos/cmp-snippy', requires = 'dcampos/nvim-snippy'}
    }
  }

	-- KEYBINDS
  use {
    'folke/which-key.nvim',
    config = function() require('plugins.which-key') end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
