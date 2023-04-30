local path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

-- automatically detect and install Packer.nvim
if vim.fn.empty(vim.fn.glob(path)) > 0 then
	vim.notify("[Plugins] Packer.nvim installing, please wait ...")
	packer_bootstrap = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		path,
	})
	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("[Plugins] Packer.nvim installed.")
end

-- protected call to prevent error in the first use
local packer = require_plugin("packer")
if packer == nil then
	return
end

-- Packer.nvim setup
packer.startup({
	function(use)
		-- Packer.nvim: the package manager can manage itself
		use("wbthomason/packer.nvim")

		-- nvim-notify: override the default notification persentation
		use({
			"rcarriga/nvim-notify",
			config = function()
				require("plugins.notify")
			end,
		})

		-- colorscheme: catppuccin.nvim
		use({
			"catppuccin/nvim",
			as = "catppuccin",
			config = function()
				require("plugins.colorscheme")
			end,
		})

		-- lualine: footer
		use({
			"nvim-lualine/lualine.nvim",
			requires = {
				"nvim-tree/nvim-web-devicons",
				"arkav/lualine-lsp-progress",
			},
			config = function()
				require("plugins.lualine")
			end,
		})

		-- nvim-tree: file explorer
		use({
			"nvim-tree/nvim-tree.lua",
			requires = "nvim-tree/nvim-web-devicons",
			config = function()
				require("plugins.tree")
			end,
		})

		-- bufferline: header for tabs
		use({
			"akinsho/bufferline.nvim",
			after = "catppuccin",
			requires = {
				"nvim-tree/nvim-web-devicons",
				"moll/vim-bbye",
			},
			config = function()
				require("plugins.bufferline")
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
				require("plugins.treesitter")
			end,
		})

		-- indent-blankline: UI enhancement for context identification
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins.blankline")
			end,
		})

		-- nvim-autopairs: automatically generate paired characters
		use({
			"windwp/nvim-autopairs",
			config = function()
				require("plugins.autopairs")
			end,
		})

		-- null-ls: automatic formatting
		use({
			"jose-elias-alvarez/null-ls.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("plugins.null-ls")
			end,
		})

		-- Comment.nvim: fast (un)commenting
		use({
			"numToStr/Comment.nvim",
			config = function()
				require("plugins.comment")
			end,
		})

		-- gitsigns.nvim: git status display
		use({
			"lewis6991/gitsigns.nvim",
			config = function()
				require("plugins.gitsigns")
			end,
		})

		-------------------------------------------------------------------------------------------------------------------
		-- Language Server Protocols
		-------------------------------------------------------------------------------------------------------------------

		-- completion core engine
		use({ "hrsh7th/nvim-cmp" })

		-- completion sources
		use({ "hrsh7th/vim-vsnip" })
		use({ "hrsh7th/cmp-vsnip" })
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-cmdline" })
		use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
	end,
	config = {
		max_jobs = 16, -- max jobs for concurrent setup
	},
})
