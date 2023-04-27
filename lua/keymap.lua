-- Vim modes:
--    normal:           n
--    insert:           i
--    visual:           v
--    visual command:   x
--    terminal:         t
--    command:          c

-- <leader>: map to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt_remap = {
  noremap = false,
  silent = true,
}

local opt_expr = {
  expr = true,
  silent = true,
}

local exports = {}

-----------------------------------------------------------------------------------------------------------------------
-- Basic keymaps and shortcuts
-----------------------------------------------------------------------------------------------------------------------

-- COMMAND: <C-j> and <C-k> for prev/next item

keymap("c", "<C-j>", "<C-n>", opt_remap)
keymap("c", "<C-k>", "<C-p>", opt_remap)

-- NORMAL: swap `$` and `g_`, jumping to tail without space

keymap("n", "$", "g_")
keymap("n", "g_", "$")

-- VISUAL: swap `$` and `g_`, jumping to tail without space

keymap("v", "$", "g_")
keymap("v", "g_", "$")

-- NORMAL: set wrapping

keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", opt_expr)
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", opt_expr)

-- NORMAL: scroll in baby step

keymap("n", "<C-j>", "10j")
keymap("n", "<C-k>", "10k")

-- VISUAL: scroll in baby step

keymap("v", "<C-j>", "10j")
keymap("v", "<C-k>", "10k")

-- NORMAL: scroll in giant step

keymap("n", "<C-d>", "30j")
keymap("n", "<C-u>", "30k")

-- VISUAL: scroll in giant step

keymap("v", "<C-d>", "30j")
keymap("v", "<C-u>", "30k")

-- VISUAL: code indenting

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- VISUAL: move and text selecting

keymap("v", "J", ":move '>+1<CR>gv-gv")
keymap("v", "K", ":move '<-2<CR>gv-gv")

-- VISUAL: copy

keymap("v", "p", '"_dp')

-- NORMAL & VISUAL: magical searching

keymap("n", "/", "/\\v", { noremap = true, silent = false })
keymap("v", "/", "/\\v", { noremap = true, silent = false })

-----------------------------------------------------------------------------------------------------------------------
-- Window Splitting
-----------------------------------------------------------------------------------------------------------------------

-- NORMAL: cancelling default `s`

keymap("n", "s", "")

-- NORMAL: split window horizontally and vertically

keymap("n", "sh", ":sp<CR>")
keymap("n", "sv", ":vsp<CR>")

-- NORMAL: close current/other window(s)

keymap("n", "sc", "<C-w>c")
keymap("n", "so", "<C-w>o")

-- NORMAL: switch between windows

keymap("n", "<leader>h", "<C-w>h")
keymap("n", "<leader>j", "<C-w>j")
keymap("n", "<leader>k", "<C-w>k")
keymap("n", "<leader>l", "<C-w>l")

-- NORMAL: window resize in baby step

keymap("n", "<C-Left>", ":vertial resize -2<CR>")
keymap("n", "<C-Right>", ":vertial resize +2<CR>")
keymap("n", "<C-Down>", ":resize -2<CR>")
keymap("n", "<C-Up>", ":resize +2<CR>")

-- NORMAL: window resize in giant step

keymap("n", "s,", ":vertial resize -10<CR>")
keymap("n", "s.", ":vertial resize +10<CR>")
keymap("n", "sj", ":resize -10<CR>")
keymap("n", "sk", ":resize +10<CR>")

-- NORMAL: window resize evenly

keymap("n", "s=", "<C-w>=")

-- NORMAL: terminal relatives
keymap("n", "<leader>t", ":sp | terminal<CR>")
keymap("n", "<leader>tv", ":vsp | terminal<CR>")

-- TERMINAL: <Esc> for back to NORMAL mode
keymap("t", "<Esc>", "<C-\\><C-n>")

keymap("t", "<leader>h", [[ <C-\><C-N><C-w>h ]])
keymap("t", "<leader>j", [[ <C-\><C-N><C-w>j ]])
keymap("t", "<leader>k", [[ <C-\><C-N><C-w>k ]])
keymap("t", "<leader>l", [[ <C-\><C-N><C-w>l ]])
