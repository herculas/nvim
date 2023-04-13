local indent = require_plugin("indent_blankline")

indent.setup({
  space_char_blankline = " ",                               -- blank line placeholder
  show_current_context = true,
  show_current_context_start = true,
  context_patterns = {
    "class",
    "function",
    "method",
    "element",
    "^if",
    "^while",
    "^for",
    "^object",
    "^table",
    "block",
    "arguments",
  },

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

  char = "▏",
})
