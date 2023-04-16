local common_config = {
	config_path = vim.fn.stdpath("config"),

	flags = {
		enable_split_window = true,
		enable_magic_search = true,
		enable_nvim_tree = true,
		enable_buffer_line = true,
		enable_telescope = true,
		enable_comment = true,
	},

	basic_keys = {
		leader_key = " ",

		-- COMMAND
		c_prev_item = "<C-k>",
		c_next_item = "<C-j>",

		-- NORMAL
		n_save = "<leader>w", -- for :w
		n_save_quit = "<leader>wq", -- for :wq
		n_save_all = "<leader>wa", -- for :wa
		n_save_all_quit = "<leader>qa", -- for :wqa
		n_force_quit = "<leader>q", -- for :qa!

		n_v_scroll_down = "<C-j>",
		n_v_scroll_up = "<C-k>",
		n_v_scroll_down_giant = "<C-d>",
		n_v_scroll_up_giant = "<C-u>",
	},

	window_keys = {
		split_horizontally = "sh",
		split_vertically = "sv",
		close_current = "sc",
		close_others = "so",

		jump_left = "<leader>h",
		jump_right = "<leader>l",
		jump_up = "<leader>k",
		jump_down = "<leader>j",

		width_dec = "<C-Left>",
		width_inc = "<C-Right>",
		width_dec_giant = "s,",
		width_inc_giant = "s.",

		height_dec = "<C-Down>",
		height_inc = "<C-Up>",
		height_dec_giant = "sj",
		height_inc_giant = "sk",

		size_equal = "s=",
	},

	nvim_tree_keys = {
		toggle = "<leader>m",
		edit = { "<CR>", "<2-LeftMouse>" },
		system_open = "o",
		vsplit = "sv",
		hsplit = "sh",
		toggle_git_ignored = "i",
		toggle_dot_files = ".",
		toggle_custom = "u",
		refresh = "R",
		create = "a",
		remove = "d",
		rename = "r",
		cut = "x",
		copy = "c",
		paste = "p",
		copy_name = "y",
		copy_path = "Y",
		copy_absolute_path = "gy",
		toggle_file_info = "I",
		tab_new = "t",
		cd = "]",
		dir_up = "[",
	},

	bufferline_keys = {
		prev_tab = "<C-h>",
		next_tab = "<C-l>",
		close_current = "<leader>bc",
		close_left = "<leader>bh",
		close_right = "<leader>bl",
		close_others = "<leader>bo",
		close_pick = "<leader>bp",
	},

	lsp_keys = {
		rename = "<leader>rn",
		code_action = "<leader>ca",
		format = "<leader>f",
		definition = "gd",
		references = "gr",
		hover = "gh",

		-- diagnostics
		open_flow = "gp",
		goto_next = "gj",
		goto_prev = "gk",
	},

	cmp_keys = {
		complete = "<C-.>",
		abort = "<C-,>",
		confirm = "<CR>",
		scroll_doc_up = "<C-u>",
		scroll_doc_down = "<C-d>",
		select_next_item = "<Tab>",
		select_prev_item = "<S-Tab>",
	},

	lua_snip_keys = {
		jump_next = "<C-l>",
		jump_prev = "<C-h>",
		next_choice = "<Tab>",
		prev_choice = "<S-Tab>",
	},

	comment_keys = {
		toggler = { -- NORMAL mode
			line = "gcc",
			block = "gbc",
		},
		opleader = { -- VISUAL mode
			line = "gc",
			block = "gb",
		},
	},

	telescope_keys = {
		find_files = "<C-p>",
		live_grep = "<C-f>",

		-- move up/down
		move_selection_next = "<C-j>",
		move_selection_prev = "<C-k>",

		-- history record
		cycle_history_next = "<Down>",
		cycle_history_prev = "<Up>",

		-- colse the window
		close = "<Esc>",

		-- preview scrolling
		preview_scrolling_up = "<C-u>",
		preview_scrolling_down = "<C-d>",
	},
}

return common_config
