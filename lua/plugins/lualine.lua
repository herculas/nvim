local lualine = require_plugin("lualine")
if lualine == nil then
	return
end

lualine.setup({
	options = { -- style configurations
		theme = "catppuccin",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		globalstatus = true,
	},
	extensions = { "nvim-tree" }, -- extensions support
	sections = { -- sections and modules
		lualine_c = {
			"filename",
			{
				"lsp_progress",
				spinner_symbols = {
					"⠁",
					"⠃",
					"⠇",
					"⠧",
					"⠷",
					"⠿",
				},
			},
		},
		lualine_x = {
			"filesize",
			{
				"fileformat",
				symbols = {
					unix = "LF",
					dos = "CRLF",
					mac = "CR",
				},
			},
			"encoding",
			"filetype",
		},
	},
})
