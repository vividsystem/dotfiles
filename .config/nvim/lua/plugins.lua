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
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function (use)
  use 'wbthomason/packer.nvim'

	--------------------
	--++ Themes ++--
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
    config = function() require("plugins.dashboard") end,
    requires = {'nvim-tree/nvim-web-devicons'}
  }
	--Statusline
	use {
  	'nvim-lualine/lualine.nvim',
		config = function() require("plugins.lualine") end,
  	requires = { 'kyazdani42/nvim-web-devicons'
		}
	}
	--Tabbar
	use {
		'romgrk/barbar.nvim',
		config = function() require("plugins.barbar") end,
		requires = 'nvim-web-devicons'
	}

	--whichkey	
	use {
  	"folke/which-key.nvim",
  	config = function()
    	vim.o.timeout = true
    	vim.o.timeoutlen = 300
    	require("which-key").setup {
    	}
  	end
	}
	--File Explorer
	use {
  	'nvim-tree/nvim-tree.lua',
		config = function() require("plugins.nvim-tree") end,
  	requires = {
    	'nvim-tree/nvim-web-devicons', -- optional
  	},
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
		requires = { {'nvim-lua/plenary.nvim'} }
	}
  use "nvim-telescope/telescope-media-files.nvim"
	-- Terminal
	use {
		"akinsho/toggleterm.nvim",
		tag = '*',
		config = function() require("plugins.toggleterm")	end
	}
	-- Neogit -> Git implementation
	use {
		'TimUntersberger/neogit',
		config = function() require("plugins.neogit") end,
		requires = 'nvim-lua/plenary.nvim'
	}
	-- Github Implementation
	use {
  	'pwntester/octo.nvim',
		config = function() require("plugins.octo") end,
  	requires = {
    	'nvim-lua/plenary.nvim',
    	'nvim-telescope/telescope.nvim',
    	'kyazdani42/nvim-web-devicons',
  	}
	}

	--use { 
  --  "ggandor/leap.nvim", 
  --  config = function() require("plugins.leap") end
  --}

	-- simple but powerful autopairs implementation
	use {
		"windwp/nvim-autopairs",
    config = function() require("plugins.nvim-autopairs") end
	}
	-- simple cheat sheet
	use {
    'sudormrfbin/cheatsheet.nvim',
    requires = {
      {'nvim-telescope/telescope.nvim'},
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
  	}
	}
	-- syntax highlighting
	use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
	use { -- highlights color strings
		'NvChad/nvim-colorizer.lua',
		config = function() require("plugins.colorizer") end,
	}

	-- code runner
	use {
		'michaelb/sniprun',
		config = function() require("plugins.sniprun") end,
		run = 'bash ./install.sh'
	}

	--+ Language Support +--
  use {"williamboman/mason.nvim", config = function() require('plugins.mason') end}
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end
  }
  use "williamboman/mason-lspconfig.nvim"
  use "folke/neodev.nvim" -- neovim lua support	
  use 'nanotee/sqls.nvim'
  use {'ray-x/go.nvim', config = function() require('plugins.go') end}
  use 'ray-x/guihua.lua'

  use {
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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
