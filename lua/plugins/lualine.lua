local lualine = require_plugin("lualine")

lualine.setup({
  options = {                                               -- style configurations
    theme = "gruvbox",
    component_seperators = {
      left = "|",
      right = "|",
    },
    section_seperators = {
      left = "",
      right = "",
    },
    globalstatus = true,
  },
  extensions = { "nvim-tree" },                             -- extensions support
  sections = {                                              -- sections and modules
    lualine_c = {
      "filename",
      {
        "lsp_progress",
        spinner_symbols = {
          " ",
          " ",
          " ",
          " ",
          " ",
          " "
        }
      },
    },
    lualine_x = {
      "filesize",
      {
        "fileformat",
        symbols = {
          unix = 'LF',
          dos = 'CRLF',
          mac = 'CR',
        },
      },
      "encoding",
      "filetype",
    },
  },
})
