vim.cmd([[
  " Expand
  imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'

  " Jump forward
  imap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'
  smap <silent><expr> jk luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : 'jk'

  " Jump backward
  imap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'
  smap <silent><expr> <C-b> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<C-j>'

  " Cycle forward through choice nodes with Control-F
  imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
  smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
]])

local luasnip = require_plugin("luasnip")
if luasnip == nil then
	return
end

luasnip.config.set_config({
	history = false, -- Don't store snippet history for less overhead
	enable_autosnippets = true, -- Allow autotrigger snippets
	store_selection_keys = "<Tab>", -- For equivalent of UltiSnips visual selection
	region_check_events = "InsertEnter", -- Event on which to check for exiting a snippet's region
	delete_check_events = "InsertLeave",
})

require("luasnip.loaders.from_lua").lazy_load({
	paths = "~/.config/nvim/lua/snippets/",
})
