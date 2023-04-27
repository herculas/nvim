local dracula = require_plugin("dracula")
if dracula == nil then
  return
end

dracula.setup({
  show_end_of_buffer = true,
  italic_comment = true,
})
vim.cmd.colorscheme("dracula")
