local config = require("config")
local telescope_keys = config.telescope_keys

if telescope_keys == nil or not config.flags.enable_telescope then
	return
end

local telescope = require_plugin("telescope")
if telescope == nil then
	return
end

telescope.setup({
	defaults = {
		initial_mode = "insert",
		layout_strategy = "horizontal",
		mappings = {
			i = {
				[telescope_keys.move_selection_next] = "move_selection_next",
				[telescope_keys.move_selection_prev] = "move_selection_previous",
				[telescope_keys.cycle_history_next] = "cycle_history_next",
				[telescope_keys.cycle_history_prev] = "cycle_history_prev",
				[telescope_keys.close] = "close",
				[telescope_keys.preview_scrolling_up] = "preview_scrolling_up",
				[telescope_keys.preview_scrolling_down] = "preview_scrolling_down",
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
			require("telescope.themes").get_dropdown({
				initial_mode = "normal",
			}),
		},
	},
})

keymap("n", telescope_keys.find_files, ":Telescope find_files<CR>")
keymap("n", telescope_keys.live_grep, ":Telescope live_grep<CR>")

pcall(telescope.load_extension, "env")
pcall(telescope.load_extension, "ui-select")
pcall(telescope.load_extension, "projects")
