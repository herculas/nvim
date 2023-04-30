local telescope = require_plugin("telescope")
local telescope_themes = require_plugin("telescope.themes")

if telescope == nil or telescope_themes == nil then
	return
end

telescope.setup({
	defaults = {
		initial_mode = "insert",
		layout_strategy = "horizontal",
		mappings = {
			i = {
				["<C-j>"] = "move_selection_next",
				["<C-k>"] = "move_selection_previous",
				["<Down>"] = "cycle_history_next",
				["<Up>"] = "cycle_history_prev",
				["<Esc>"] = "close",
				["<C-u>"] = "preview_scrolling_up",
				["<C-d>"] = "preview_scrolling_down",
			},
		},
	},
	pickers = {
		find_files = {
			theme = "ivy",
		},
	},
	extensions = {
		["ui-select"] = {
			telescope_themes.get_dropdown({
				initial_mode = "normal",
			}),
		},
	},
})

-- glocal keymaps
keymap("n", "<C-p>", ":Telescope find_files<CR>")
keymap("n", "<C-f>", ":Telescope live_grep<CR>")

-- load extensions
pcall(telescope.load_extension, "env")
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "projects")
