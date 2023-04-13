local status, cmp = pcall(require, "cmp")
if not status then
  vim.notify("[LSP] cmp not found.")
  return
end

local status_lua, luasnip = pcall(require, "luasnip")
if not status_lua then
  vim.notify("[LSP] luasnip not found.")
  return
end

local status_cnf, config = pcall(require, "config")
if not status_cnf then
  vim.notify("[LSP] global config not found.")
  return
end

local has_words_before = function()
  local line, column = unpack(vim.api.nvim_win_get_cursor(0))
  return column ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(column, column):match("%s") == nil
end

local cmp_keys = config.cmp_keys
local mapping = {
  -- start completion
  [cmp_keys.complete] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  -- cancel completion
  [cmp_keys.abort] = cmp.mapping({
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  }),
  -- confirm completion
  -- accept currently selected item. If none selected, `select` the first one.
  [cmp_keys.confirm] = cmp.mapping.confirm({
    select = true,
    behavior = cmp.ConfirmBehavior.Replace,
  }),
  -- enable scrolling if too many contents
  [cmp_keys.scroll_doc_up] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
  [cmp_keys.scroll_doc_down] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
  -- prev/next item
  [cmp_keys.select_prev_item] = cmp.mapping.select_prev_item(),
  [cmp_keys.select_next_item] = cmp.mapping.select_next_item(),
}

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
  },
  mapping = mapping,
  sources = cmp.config.sources({
    { name = "luasnip", group_index = 1, },
    { name = "nvim_lsp", group_index = 1, },
    { name = "nvim_lsp_signature_help", group_index = 1, },
    { name = "buffer", group_index = 2, },
    { name = "path", group_index = 2, },
  }),
  formatting = require("lsp.complete.lspkind").formatting,
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = { { name = "buffer", } },
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources(
    {{ name = "path", }},
    {{ name = "cmdline", }}
  ),
})

cmp.setup.filetype({ "markdown", "help" }, {
  sources = {
    { name = "luasnip", },
    { name = "buffer", },
    { name = "path", },
  }
})

require("lsp.complete.luasnip")
