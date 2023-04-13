local config = require("config")
if config.bufferline_keys == nil or not config.flags.enable_buffer_line then
  return
end

local bufferline = require_plugin("bufferline")

-- bufferline configuration
bufferline.setup({
  options = {
    close_command = "Bdelete! %d",                          -- close tabs
    right_mouse_command = "Bdelete! %d",                    -- close tabs using mouse
    offsets = {                                             -- side column for nvim-tree
      filetype = "NvimTree",
      text = "File Explorer",
      highlight = "Directory",
      text_align = "left",
    },
    diagnostics = "nvim_lsp",                               -- LSP
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
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

local bufferline_keys = config.bufferline_keys

-- NORMAL: switch between tabs
keymap("n", bufferline_keys.prev_tab, ":BufferLineCyclePrev<CR>")
keymap("n", bufferline_keys.next_tab, ":BufferLineCycleNext<CR>")

-- NORMAL: close current buffer
keymap("n", bufferline_keys.close_current, ":Bdelete!<CR>")

-- NORMAL: close the tab on the left/right
keymap("n", bufferline_keys.close_left, ":BufferLineCloseLeft<CR>")
keymap("n", bufferline_keys.close_right, ":BufferLineCloseRight<CR>")

-- NORMAL: close other tabs
keymap("n", bufferline_keys.close_others, ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>")

-- NORMAL: close selected tab
keymap("n", bufferline_keys.close_pick, ":BufferLinePickClose<CR>")
