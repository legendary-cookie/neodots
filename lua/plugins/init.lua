return require('packer').startup({function()
	use {
		'wbthomason/packer.nvim',
		event = "VimEnter"
	}

	use {
		"ellisonleao/glow.nvim",
		config = function()
			vim.g.glow_border = "rounded"
			vim.g.glow_width = 120
		end
	}

	use {
		"AckslD/nvim-neoclip.lua",
		requires = {'tami5/sqlite.lua', module = 'sqlite'},
		config = function()
			require('neoclip').setup()
		end,
	}

	use 'voldikss/vim-floaterm'

	use { "neovim/nvim-lspconfig" }

	use {
		"williamboman/nvim-lsp-installer",
		config = function ()
			require "plugins.configs.lspconfig"
		end
	}

	use {
		'stevearc/dressing.nvim',
		config = function()
			require'plugins.configs.dressing'
		end
	}

	use {
		"rafamadriz/friendly-snippets",
		event = "InsertEnter"
	}

	use {
		"hrsh7th/nvim-cmp",
		config = function ()
			require'plugins.configs.completion'
		end,
		after = "friendly-snippets"
	}

	use {
		"L3MON4D3/LuaSnip",
		wants = "friendly-snippets",
		after = "nvim-cmp",
		config = function ()
			require("luasnip/loaders/from_vscode").load { path = "~/.local/share/nvim/site/pack/packer/opt/friendly-snippets" }
			require("luasnip/loaders/from_vscode").load()
		end
	}

	use {
		"hrsh7th/cmp-nvim-lsp",
		after = "nvim-cmp"
	}

	use {
		"hrsh7th/cmp-nvim-lua",
		after = "cmp-nvim-lsp"
	}

	use {
		"hrsh7th/cmp-buffer",
		after = "cmp-nvim-lua"
	}

	use {
		"hrsh7th/cmp-path",
		after = "cmp-buffer"
	}

	use {
		"onsails/lspkind-nvim"
	}

	-- Git
	use {
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup{}
		end
	}

	use {
		"glepnir/dashboard-nvim",
		config = function()
			require "plugins.configs.dashboard"
		end
	}

	use {
		'sudormrfbin/cheatsheet.nvim',

		requires = {
			{'nvim-telescope/telescope.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		}
	}

	use {
		'jghauser/mkdir.nvim',
		config = function()
			require('mkdir')
		end
	}


	use {
		'folke/tokyonight.nvim',
		config = function()
			vim.cmd[[colorscheme tokyonight]]
		end
	}

	use {
		'sunjon/shade.nvim',
		config = function()
			require'plugins.configs.shade'
		end
	}

	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require'colorizer'.setup()
		end
	}

	use {
		'nvim-lualine/lualine.nvim',
		config = function()
			require'lualine'.setup({
				options = {
					theme = 'tokyonight'
				}
			})
		end,
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require'plugins.configs.nvim-treesitter'
		end, 
		run = ':TSUpdate'
	}
	require'plugins.configs.keybinds'
end,

config = {
	display = {
		-- Create a floating window for packer commands
		open_fn = require('packer.util').float,
	}
}})

