local status, lspkind = pcall(require, "lspkind")
if not status then
  vim.notify("[LSP] lspkind not found.")
  return
end

lspkind.init({
  mode = "symbol_text",
  preset = "codicons",
  symbol_map = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
  },
})

local exports = {}
exports.formatting = {
  format = lspkind.cmp_format({
    mode = "symbol_text",
    maxwidth = 50,
    before = function (entry, vim_item)
      vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
      return vim_item
    end,
  }),
}

return exports
