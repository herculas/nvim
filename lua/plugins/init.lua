local fn = vim.fn
local path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

-- automatically detect and install Packer.nvim
if fn.empty(fn.glob(path)) > 0 then
	vim.notify("[Plugins] Packer.nvim installing, please wait ...")
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		path,
	})

	local rtp_addition = fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("[Plugins] Packer.nvim installed.")
end

-- a protected call to prevent error in the first use
local packer = require_plugin("packer")
if packer == nil then
	return
end

-- Packer.nvim setup
packer.startup({
	function(use)
		-- Packer.nvim: the package manager for neovim
		use("wbthomason/packer.nvim")

		-- gruvbox.nvim: colorscheme for neovim
		use("ellisonleao/gruvbox.nvim")

		-- nvim-tree: side column file explorer
		use({
			"nvim-tree/nvim-tree.lua",
			requires = "nvim-tree/nvim-web-devicons",
			config = function()
				require("plugins.nvim-tree")
			end,
		})

		-- bufferline: header tab interface
		use({
			"akinsho/bufferline.nvim",
			requires = {
				"nvim-tree/nvim-web-devicons",
				"moll/vim-bbye",
			},
			config = function()
				require("plugins/bufferline")
			end,
		})

		-- lualine: footer information description
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"nvim-tree/nvim-web-devicons",
				"arkav/lualine-lsp-progress",
			},
			config = function()
				require("plugins/lualine")
			end,
		})

		-- nvim-treesitter: code highlighting
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = {
				"nvim-treesitter/nvim-treesitter-refactor",
				"nvim-treesitter/nvim-treesitter-textobjects",
			},
			config = function()
				require("plugins.nvim-treesitter")
			end,
		})

		-- indent-blankline: UI enhancement for context identification
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins.indent-blankline")
			end,
		})

		use({
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.autopairs")
			end,
		})

		use({
			"numToStr/Comment.nvim",
			config = function()
				require("plugins.comment")
			end,
		})
		-------------------------------------------------------------------------------------------------------------------
		-- LSP-relative plugins
		-------------------------------------------------------------------------------------------------------------------

		use({ "williamboman/mason.nvim", run = ":MasonUpdate" }) -- mason LSP engine
		use({ "williamboman/mason-lspconfig.nvim" }) -- mason LSP config
		use({ "neovim/nvim-lspconfig" }) -- neovim LSP config settings

		-- complete engine
		use({ "hrsh7th/nvim-cmp" }) -- complete core engine

		-- complete sources
		use({ "hrsh7th/vim-vsnip" }) -- complete snippet engine
		use({ "hrsh7th/cmp-vsnip" }) -- complete source for snippet
		use({ "hrsh7th/cmp-nvim-lsp" }) --      name = nvim_lsp,
		use({ "hrsh7th/cmp-buffer" }) --      name = buffer,
		use({ "hrsh7th/cmp-path" }) --      name = path,
		use({ "hrsh7th/cmp-cmdline" }) --      name = cmdline,
		use({ "hrsh7th/cmp-nvim-lsp-signature-help" }) --      name = nvim_lsp_signature_help,
		use({ "rafamadriz/friendly-snippets" }) -- common programming language snippets

		-- snippet engine
		use({ "L3MON4D3/LuaSnip" })
		use({ "saadparwaiz1/cmp_luasnip" })

		-- misc
		use({ "onsails/lspkind-nvim" }) -- UI enhancement
		use({ "folke/neodev.nvim" }) -- Lua enhancement

		-- formatting engines
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("plugins.null-ls")
			end,
		})

		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		max_jobs = 16, -- max jobs for concurrent setup
	},
})
