local config = require("config")

-- Modes:
--      normal mode:            n
--      insert mode:            i
--      visual mode:            v
--      visual command mode:    x
--      terminal mode:          t
--      command mode:           c

-----------------------------------------------------------------------------------------------------------------------
-- basic key bindings and shortcuts 
-----------------------------------------------------------------------------------------------------------------------

local basic_keys = config.basic_keys

-- map <Leader> to <space>
vim.g.mapleader = basic_keys.leader_key
vim.g.maplocalleader = basic_keys.leader_key

local opt_remap = {
  noremap = false,
  silent = true,
}

local opt_expr = {
  expr = true,
  silent = true,
}

-- COMMAND: <Ctrl-j> and <Ctrl-k> for prev/next
keymap("c", basic_keys.c_next_item, "<C-n>", opt_remap)
keymap("c", basic_keys.c_prev_item, "<C-p>", opt_remap)

-- NORMAL: shortcut for save and quit 
keymap("n", basic_keys.n_save, ":w<CR>")
keymap("n", basic_keys.n_save_quit, ":wq<CR>")
keymap("n", basic_keys.n_save_all, ":wa<CR>")
keymap("n", basic_keys.n_save_all_quit, ":wqa<CR>")
keymap("n", basic_keys.n_force_quit, ":qa!<CR>")

-- NORMAL & VISUAL: swap `$` and `g_`, jump to tail without space
keymap("n", "$", "g_")
keymap("n", "g_", "$")
keymap("v", "$", "g_")
keymap("v", "g_", "$")

-- NORMAL: :set wrapping
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", opt_expr)
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", opt_expr)

-- NORMAL & VISUAL: scroll
keymap("n", basic_keys.n_v_scroll_down, "10j")
keymap("n", basic_keys.n_v_scroll_up, "10k")
keymap("v", basic_keys.n_v_scroll_down, "10j")
keymap("v", basic_keys.n_v_scroll_up, "10k")

-- NORMAL & VISUAL: giant step scroll
keymap("n", basic_keys.n_v_scroll_down_giant, "30j")
keymap("n", basic_keys.n_v_scroll_up_giant, "30k")
keymap("v", basic_keys.n_v_scroll_down_giant, "30j")
keymap("v", basic_keys.n_v_scroll_up_giant, "30k")

-- VISUAL: code indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- VISUAL: move and text selecting
keymap("v", "J", ":move '>+1<CR>gv-gv")
keymap("v", "K", ":move '<-2<CR>gv-gv")

-- VISUAL: copy
keymap("v", "p", "_dp")

-- INSERT: jump to the beginning/ending of current line
-- keymap("i", "<C-h>", "<Esc>I")
-- keymap("i", "<C-l>", "<Esc>A")

-- NORMAL & VISUAL: magical searching
if config.flags.enable_magic_search then
  keymap("n", "/", "/\\v", { noremap = true, silent = false })
  keymap("v", "/", "/\\v", { noremap = true, silent = false })
end

-----------------------------------------------------------------------------------------------------------------------
-- window splitting
-----------------------------------------------------------------------------------------------------------------------

if config.window_keys ~= nil and config.flags.enable_split_window then
  local window_keys = config.window_keys

  -- NORMAL: cancel default 's'
  keymap("n", "s", "")

  -- NORMAL: set `sv` and `sh` for window splitting vertically and horizontally
  keymap("n", window_keys.split_vertically, ":vsp<CR>")
  keymap("n", window_keys.split_horizontally, ":sp<CR>")

  -- NORMAL: close current/other window(s)
  keymap("n", window_keys.close_current, "<C-w>c")
  keymap("n", window_keys.close_others, "<C-w>o")

  -- NORMAL: switch between windows using <Leader>
  keymap("n", window_keys.jump_left, "<C-w>h")
  keymap("n", window_keys.jump_right, "<C-w>j")
  keymap("n", window_keys.jump_up, "<C-w>k")
  keymap("n", window_keys.jump_down, "<C-w>l")

  -- NORMAL: window resize
  keymap("n", window_keys.width_dec, ":vertical resize -2<CR>")
  keymap("n", window_keys.width_inc, ":vertical resize +2<CR>")
  keymap("n", window_keys.height_dec, ":resize -2<CR>")
  keymap("n", window_keys.height_inc, ":resize +2<CR>")

  -- NORMAL: window resize (giant)
  keymap("n", window_keys.width_dec_giant, ":vertical resize -10<CR>")
  keymap("n", window_keys.width_inc_giant, ":vertical resize +10<CR>")
  keymap("n", window_keys.height_dec_giant, ":resize -10<CR>")
  keymap("n", window_keys.height_inc_giant, ":resize +10<CR>")

  -- NORMAL: window re-size default
  keymap("n", window_keys.size_equal, "<C-w>=")
end

-- NORMAL: terminal relatives
keymap("n", "<leader>t", ":sp | terminal<CR>")
keymap("n", "<leader>tv", ":vsp | terminal<CR>")

-- TERMINAL: <Esc> for back to NORMAL mode
keymap("t", "<Esc>", "<C-\\><C-n>")

keymap("t", "<leader>h", [[ <C-\><C-N><C-w>h ]])
keymap("t", "<leader>j", [[ <C-\><C-N><C-w>j ]])
keymap("t", "<leader>k", [[ <C-\><C-N><C-w>k ]])
keymap("t", "<leader>l", [[ <C-\><C-N><C-w>l ]])

-----------------------------------------------------------------------------------------------------------------------
-- export functions
-----------------------------------------------------------------------------------------------------------------------

local exports = {}

-----------------------------------------------------------------------------------------------------------------------
-- LSP callbacks
-----------------------------------------------------------------------------------------------------------------------

local lsp_keys = config.lsp_keys

exports.map_lsp = function(map_buf)
  map_buf("n", lsp_keys.rename, "<cmd>lua vim.lsp.buf.rename()<CR>")
  map_buf("n", lsp_keys.code_action, "<cmd>lua vim.lsp.buf.code_action()<CR>")
  if vim.fn.has("nvim-0.8") == 1 then
    map_buf("n", lsp_keys.format, "<cmd>lua vim.lsp.buf.format({ async = true })<CR>")
  else
    map_buf("n", lsp_keys.format, "<cmd>lua vim.lsp.buf.formatting()<CR>")
  end
  map_buf("n", lsp_keys.definition, "<cmd>lua vim.lsp.buf.definition()<CR>")
  map_buf("n", lsp_keys.references, "<cmd>lua vim.lsp.buf.references()<CR>")
  map_buf("n", lsp_keys.hover, "<cmd>lua vim.lsp.buf.hover()<CR>")

  map_buf("n", lsp_keys.open_flow, "<cmd>lua vim.diagnostic.open_float()<CR>")
  map_buf("n", lsp_keys.goto_next, "<cmd>lua vim.diagnostic.goto_next()<CR>")
  map_buf("n", lsp_keys.goto_prev, "<cmd>lua vim.diagnostic.goto_prev()<CR>")
end

-----------------------------------------------------------------------------------------------------------------------
-- LSP TS callbacks
-----------------------------------------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------------------------------------------
-- DAP callbacks
-----------------------------------------------------------------------------------------------------------------------


return exports
