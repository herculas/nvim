local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazy_path) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazy_path,
	})
end
vim.opt.rtp:prepend(lazy_path)

local lazy = require_plugin("lazy")
if lazy == nil then
	return
end

-- lazy.nvim setup
lazy.setup(
	{
		---------------------------------------------------------------------------------------------------------------------
		-- Basic Plugins
		---------------------------------------------------------------------------------------------------------------------

		-- nvim-notify: override the default notification presentation
		{
			"rcarriga/nvim-notify",
			config = function()
				require("plugins.notify")
			end,
		},

		-- colorscheme: catppuccin.nvim
		{
			"catppuccin/nvim",
			name = "catppuccin",
			lazy = false,
			priority = 1000,
			config = function()
				require("plugins.colorscheme")
			end,
		},

		-- lualine: footer
		{
			"nvim-lualine/lualine.nvim",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
				"arkav/lualine-lsp-progress",
			},
			config = function()
				require("plugins.lualine")
			end,
		},

		-- nvim-tree: file explorer
		{
			"nvim-tree/nvim-tree.lua",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("plugins.tree")
			end,
		},

		-- bufferline: header for tabs
		{
			"akinsho/bufferline.nvim",
			dependencies = {
				"catppuccin/nvim",
				"nvim-tree/nvim-web-devicons",
				"moll/vim-bbye",
			},
			config = function()
				require("plugins.bufferline")
			end,
		},

		-- nvim-treesitter: code highlighting
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			dependencies = {
				"nvim-treesitter/nvim-treesitter-refactor",
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
			config = function()
				require("plugins.treesitter")
			end,
		},

		-- indent-blankline: UI enhancement for context identification
		{
			"lukas-reineke/indent-blankline.nvim",
			dependencies = {
				"catppuccin/nvim",
			},
			config = function()
				require("plugins.blankline")
			end,
		},

		-- nvim-autopairs: automatically generate paired characters
		{
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.autopairs")
			end,
		},

		-- null-ls: automatic formatting
		{
			"jose-elias-alvarez/null-ls.nvim",
			lazy = true,
			dependencies = "nvim-lua/plenary.nvim",
			config = function()
				require("plugins.null-ls")
			end,
		},

		-- Comment.nvim: fast (un)commenting
		{
			"numToStr/Comment.nvim",
			config = function()
				require("plugins.comment")
			end,
		},

		-- gitsigns.nvim: git status display
		{
			"lewis6991/gitsigns.nvim",
			config = function()
				require("plugins.gitsigns")
			end,
		},

		-- telescope: fuzzy finder over lists
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
				"LinArcX/telescope-env.nvim",
				"nvim-telescope/telescope-ui-select.nvim",
			},
			config = function()
				require("plugins.telescope")
			end,
		},

		-- project.nvim: all-in-one project management
		{
			"ahmedkhalf/project.nvim",
			config = function()
				require("plugins.project")
			end,
		},

		-- dashboard-nvim: dashboard settings
		{
			"glepnir/dashboard-nvim",
			event = "VimEnter",
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
			config = function()
				require("plugins.dashboard")
			end,
		},

		-- aerial.nvim: code outline navigation
		{
			"stevearc/aerial.nvim",
			config = function()
				require("plugins.aerial")
			end,
		},

		---------------------------------------------------------------------------------------------------------------------
		-- LSP and Completion Settings
		---------------------------------------------------------------------------------------------------------------------

		-- completion engine and sources
		{
			"hrsh7th/nvim-cmp", -- completion core engine
			event = "InsertEnter",
			dependencies = { -- completion sources
				"hrsh7th/vim-vsnip",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-vsnip",
				"hrsh7th/cmp-buffer", -- completion for buffer
				"hrsh7th/cmp-path", -- completion for path
				"hrsh7th/cmp-cmdline", -- completion for command lines
				"f3fora/cmp-spell", -- spell check
				"hrsh7th/cmp-nvim-lsp-signature-help",
			},
		},

		-- Mason LSP engine
		{
			"williamboman/mason.nvim",
			build = ":MasonUpdate",
		},

		-- LSP configuration
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason-lspconfig.nvim" },

		-- snippet engine
		{ "L3MON4D3/LuaSnip" },
		{ "saadparwaiz1/cmp_luasnip" },
		{ "rafamadriz/friendly-snippets" },

		-- miscellaneous
		{ "onsails/lspkind-nvim" },
		{ "folke/neodev.nvim" },
	},

	-- lazy.nvim configurations
	{
		ui = {
			border = "rounded",
		},
	}
)
