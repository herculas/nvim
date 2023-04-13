local treesitter = require_plugin("nvim-treesitter.configs")

treesitter.setup({
  -- language parser specification
  ensure_installed = {
    "cpp",
    "json",
    "html",
    "css",
    "vim",
    "lua",
    "javascript",
    "typescript",
  },

  -- code highlighting module
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = function (lang, buf)
      return vim.api.nvim_buf_line_count(buf) > 10000
    end,
  },

  -- incremental selection module
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      node_decremental = "<BS>",
      scope_incremental = "<TAB>",
    },
  },

  -- code indent module
  indent = {
    enable = true,
  },

  -- code refactor module
  refactor = {
    highlight_definitions = {
      enable = true,

      -- set to `false` if you have an `updatetime` of ~100
      clear_on_cursor_move = true,
    },
    highlight_current_scope = {
      enable = true,
    },
  },

  -- text objects module
  textobjects = {
    select = {
      enable = true,

      -- automatically jump forward to textobjects, similar to targets.vim
      lookahead = true,

      -- use the capture groups defined in textobjects.scm
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
        ["al"] = "loop.outer",
        ["il"] = "loop.inner",
        ["ab"] = "block.outer",
        ["ib"] = "block.inner",
      },
    },
    swap = {
      enable = false,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    move = {
      enable = true,

      -- whether to set jumps in the jumplist
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
})

-- enable folding module
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- not fold in default
vim.opt.foldlevel = 99
