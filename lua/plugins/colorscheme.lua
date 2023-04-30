local catppuccin = require_plugin("catppuccin")
if catppuccin == nil then
	return
end

catppuccin.setup({
	flavour = "macchiato",
	integrations = {
		cmp = true,
		dashboard = true,
		gitsigns = true,
		mason = true,
		notify = true,
		nvimtree = true,
		telescope = true,
		treesitter = true,
	},
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
})

vim.cmd.colorscheme("catppuccin")
