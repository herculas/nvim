local luasnip = require_plugin("luasnip")
local types = require_plugin("luasnip.util.types")

if luasnip == nil or types == nil then
	return
end

local status_cnf, config = pcall(require, "config")
if not status_cnf then
	vim.notify("[LSP] global config not found.")
	return
end

-- custom snippets
require("luasnip.loaders.from_lua").lazy_load({
	paths = "~/.config/nvim/lua/snippets/",
})

luasnip.config.set_config({
	history = true,
	update_events = "TextChanged,TextChangedI",
	enable_autosnippets = true,
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "<--", "Error" } },
			},
		},
	},
})

local luasnip_keys = config.lua_snip_keys

vim.keymap.set({ "i", "s" }, luasnip_keys.jump_next, function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end)

vim.keymap.set({ "i", "s" }, luasnip_keys.jump_prev, function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end)

vim.keymap.set({ "i", "s" }, luasnip_keys.next_choice, function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, luasnip_keys.prev_choice, function()
	if luasnip.choice_active() then
		luasnip.change_choice(-1)
	end
end)
