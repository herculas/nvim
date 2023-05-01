local luasnip = require_plugin("luasnip")
local types = require_plugin("luasnip.util.types")

if luasnip == nil or types == nil then
	return
end

require("luasnip.loaders.from_vscode").lazy_load() -- load friendly-snippts
require("luasnip.loaders.from_lua").lazy_load({ -- load custom snippets
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

-- keymaps for luasnip
vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	end
end)

vim.keymap.set({ "i", "s" }, "<C-h>", function()
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	end
end)

vim.keymap.set({ "i", "s" }, "<Tab>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(1)
	end
end)

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
	if luasnip.choice_active() then
		luasnip.change_choice(-1)
	end
end)
