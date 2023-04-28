local tree = require_plugin("nvim-tree")
if tree == nil then
	return
end

-- NORMAL: nvim-tree toggle
keymap("n", "<leader>m", ":NvimTreeToggle<CR>", { noremap = true, silent = true })

local function on_attach(bufnr)
	local api = require("nvim-tree.api")

	local function opts(desc)
		return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
	vim.keymap.set("n", "o", api.node.run.system, opts("Run System"))
	vim.keymap.set("n", "sv", api.node.open.vertical, opts("Open: Vertical Split"))
	vim.keymap.set("n", "sh", api.node.open.horizontal, opts("Open: Horizontal Split"))
	vim.keymap.set("n", "i", api.tree.toggle_gitignore_filter, opts("Toggle Git Ignore"))
	vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("Toggle Dotfiles"))
	vim.keymap.set("n", "u", api.tree.toggle_custom_filter, opts("Toggle Hidden"))
	vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
	vim.keymap.set("n", "a", api.fs.create, opts("Create"))
	vim.keymap.set("n", "r", api.fs.remove, opts("Delete"))
	vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
	vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
	vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
	vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
	vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
	vim.keymap.set("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
	vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
	vim.keymap.set("n", "I", api.node.show_info_popup, opts("Info"))
	vim.keymap.set("n", "t", api.node.open.tab, opts("Open: New Tab"))
	vim.keymap.set("n", "]", api.tree.change_root_to_node, opts("CD"))
	vim.keymap.set("n", "[", api.tree.change_root_to_parent, opts("Up"))
end

-- nvim-tree setup configuration
tree.setup({
	-- completely disable netrw
	disable_netrw = true,

	-- do not display git status icon
	git = { enable = true },

	-- project plugin settings: supporting change directories
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},

	-- file display filters:
	filters = {
		-- hide dot files
		dotfiles = true,
	},

	-- view settings:
	view = {
		width = 36, -- width of the panel
		side = "left", -- display position
		hide_root_folder = false, -- hide the root directory
		mappings = { -- key settings
			custom_only = true,
		},
		number = false, -- not display line numbers
		relativenumber = false,
		signcolumn = "yes", -- display icons
	},

	-- custom key mappings
	on_attach = on_attach,

	actions = {
		open_file = {
			resize_window = true, -- resize the panel at first opening
			quit_on_open = false, -- close the panel after opening new files
		},
	},

	system_open = {
		cmd = "open", -- open file in MacOS
	},

	renderer = {
		indent_markers = {
			enable = true,
			icons = {
				corner = "└",
				edge = "│",
				item = "│",
				bottom = "─",
				none = "  ",
			},
		},
		icons = {
			webdev_colors = true,
			git_placement = "after",
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "󰗧",
					untracked = "",
					deleted = "",
					ignored = "◌",
				},
			},
		},
		special_files = {
			"Cargo.toml",
			"Makefile",
			"README.md",
			"readme.md",
			"package.json",
			"package-lock.json",
			"CMakeLists.txt",
			"LICENSE",
		},
	},
})
