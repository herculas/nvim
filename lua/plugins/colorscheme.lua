require("catppuccin").setup({
	flavour = "macchiato",
	integrations = {
		cmp = true,
		mason = true,
	},
})

vim.cmd.colorscheme("catppuccin")
