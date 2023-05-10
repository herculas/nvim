local indent = require_plugin("indent_blankline")

if indent == nil then
	return
end

indent.setup({
	enabled = true,
	colored_indent_levels = false,

	char = "▏",
	context_char = "▏",
	show_trailing_blankline_indent = false,
	use_treesitter = true,
	show_current_context = true,
	show_current_context_start = true,

	space_char_blankline = " ", -- blank line placeholder

	-- excluded filetypes for lines
	filetype_exclude = {
		"null-ls-info",
		"dashboard",
		"packer",
		"terminal",
		"help",
		"log",
		"markdown",
		"lsp-installer",
		"lspinfo",
		"toggleterm",
		"text",
	},
})
