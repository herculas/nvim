local luasnip = require_plugin("luasnip")
local cmp = require_plugin("cmp")

if cmp == nil or luasnip == nil then
	return
end

local mapping = {
	-- start completion
	["<C-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
	-- cancel completion
	["<C-,>"] = cmp.mapping({
		i = cmp.mapping.abort(),
		c = cmp.mapping.close(),
	}),
	-- confirm completion
	-- accept currently selected item. If none selected, `select` the first one.
	["<CR>"] = cmp.mapping.confirm({
		select = true,
		behavior = cmp.ConfirmBehavior.Replace,
	}),
	-- enable scrolling if too many contents
	["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
	["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
	-- prev/next item
	["<Tab>"] = cmp.mapping.select_next_item(),
	["<S-Tab>"] = cmp.mapping.select_prev_item(),
}

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	window = {
		completion = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None,CmpItemKind:Type,CmpItemAbbrMatch:Identifier",
			minwidth = 60,
		}),
		documentation = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:Normal,CursorLine:PmenuSel,Search:None",
		}),
	},
	mapping = mapping,
	sources = cmp.config.sources({
		{ name = "luasnip", group_index = 1 },
		{ name = "nvim_lsp", group_index = 1 },
		{ name = "nvim_lsp_signature_help", group_index = 1 },
		{ name = "buffer", group_index = 2 },
		{ name = "path", group_index = 2 },
		{ name = "spell", group_index = 2 },
	}),
	formatting = require("lsp.complete.lspkind").formatting,
})

cmp.setup.cmdline("/", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = { { name = "buffer" } },
})

cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({ { name = "path" } }, { { name = "cmdline" } }),
})

cmp.setup.filetype({ "markdown", "help" }, {
	sources = {
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
})

require("lsp.complete.luasnip")
