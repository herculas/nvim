vim.g.encoding = "UTF-8"                    -- string-encoding used internally
vim.o.fileencoding = 'utf-8'                -- file-content encoding for the current buffer

vim.o.scrolloff = 8                         -- minimal number of lines to keep above & below the cursor
vim.o.sidescrolloff = 8                     -- minimal number of columns to keep left & right of cursor

vim.wo.number = true                        -- print the line number in front of each line
vim.wo.relativenumber = true                -- show the line number relative to the current line

vim.wo.cursorline = true                    -- hightlight the current line

vim.wo.signcolumn = "yes"                   -- draw the signcolumn, 'yes' means always

vim.wo.colorcolumn = "120"                  -- highlighted column

vim.o.tabstop = 2                           -- number of spaces that a <Tab> in the file counts for
vim.bo.tabstop = 2
vim.o.softtabstop = 2                       -- number of spaces that a <Tab> counts for while editing

vim.o.shiftround = true                     -- round indent to multiple of 'shiftwidth'
vim.o.shiftwidth = 2                        -- number of spaces to use for each step of (auto)indent
vim.bo.shiftwidth = 2

vim.o.expandtab = true                      -- INSERT: use the appropriate number of spaces to insert a <Tab>
vim.bo.expandtab = true

vim.o.autoindent = true                     -- copy indent from current line when starting a new line
vim.bo.autoindent = true
vim.o.smartindent = true                    -- do smart auto-indenting when starting a new line

vim.o.ignorecase = true                     -- ignore case in search patterns
vim.o.smartcase = true                      -- override 'ignorecase' if search pattern contains uppercase chars

vim.o.hlsearch = false                      -- cancel the highlighting of matched search patterns
vim.o.incsearch = true                      -- show the pattern as it was typed so far, incremental searching

vim.o.cmdheight = 2                         -- number of lines for command-line

vim.o.autoread = true                       -- automatically read files changed outside of nvim
vim.bo.autoread = true

vim.wo.wrap = false                         -- not wrapping lines even if longer than the width of window
vim.o.whichwrap = '<,>,[,]'                 -- allow keys move cursor left/right to move to the prev/next line

vim.o.hidden = true                         -- a buffer becomes hidden when it is abandoned

vim.o.mouse = "a"                           -- enable mouse support, 'a' means support all modes

vim.o.backup = false                        -- cancel backup files
vim.o.writebackup = false                   -- cancel backup files
vim.o.swapfile = false                      -- cancel swap files for the buffer

vim.o.updatetime = 300                      -- swap file written to disk if nothing is typed in 300 ms
vim.o.timeoutlen = 800                      -- time to wait for a mapped sequence to complete

vim.o.splitbelow = true                     -- put the splitted window below the current one (:split)
vim.o.splitright = true                     -- put the splitted window to the right of the current one (:vsplit)

vim.g.completeopt = "menu,menuone,noselect,noinsert"
                                            -- options for INSERT mode completion:
                                            --    menu:      use a popup menu to show possible options
                                            --    menuone:   hse the popup menu also when there is only one match
                                            --    noinsert:  do not insert any text for a match until the user selects
                                            --    noselect:  do not select a match and force the user to select one

vim.o.termguicolors = true                  -- enable 24-bit RGB color in the terminal UI (TUI)
vim.opt.termguicolors = true

vim.o.wildmenu = true                       -- command-line completion operates in enhanced mode
vim.o.shortmess = vim.o.shortmess .. 'c'    -- do not give ins-completion-menu messages
vim.o.pumheight = 10                        -- maximum number of items to show in the popup menu
vim.o.showtabline = 2                       -- always show the tabline
vim.o.showmode = false                      -- cancel the display of modes
