local bufferline = require_plugin("bufferline")
if bufferline == nil then
	return
end

-- bufferline configuration
bufferline.setup({
	options = {
		close_command = "Bdelete! %d", -- close tabs
		right_mouse_command = "Bdelete! %d", -- close tabs using mouse
    separator_style = "thick", -- appearance of the separators
		offsets = { -- side column for nvim-tree
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "center",
        separator = true,
      },
		},
		diagnostics = "nvim_lsp", -- LSP
		diagnostics_indicator = function(_, _, diagnostics_dict, _)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " " or (e == "warning" and " " or "")
				s = s .. n .. sym
			end
			return s
		end,
	},
})

-----------------------------------------------------------------------------------------------------------------------
-- bufferline key shortcuts
-----------------------------------------------------------------------------------------------------------------------

-- NORMAL: switch between tabs
keymap("n", "<C-h>", ":BufferLineCyclePrev<CR>")
keymap("n", "<C-l>", ":BufferLineCycleNext<CR>")

-- NORMAL: close current/other tab(s)
keymap("n", "<leader>bc", ":Bdelete!<CR>")
keymap("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")

-- NORMAL: close the tab on the left/right
keymap("n", "<leader>bh", ":BufferLineCloseLeft<CR>")
keymap("n", "<leader>bl", ":BufferLineCloseRight<CR>")

-- NORMAL: close selected tab
keymap("n", "<leader>bp", ":BufferLinePickClose<CR>")
