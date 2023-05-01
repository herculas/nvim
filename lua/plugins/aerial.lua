local aerial = require_plugin("aerial")
if aerial == nil then
	return
end

aerial.setup({
	backends = {
		"treesitter",
		"lsp",
		"markdown",
		"man",
	},

	layout = {
		max_width = {
			40,
			0.2,
		},
		width = nil,
		min_width = 25,
		default_direction = "prefer_right",
	},
})

keymap("n", "<leader>n", "<cmd>AerialToggle<CR>")
