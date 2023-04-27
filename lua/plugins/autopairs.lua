local autopairs = require_plugin("nvim-autopairs")

if autopairs == nil then
	return
end

autopairs.setup({
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false,
	},
})

-- insert `(` after selecting function or method items
local cmp_autopairs = require_plugin("nvim-autopairs.completion.cmp")
local cmp = require_plugin("cmp")
if cmp_autopairs == nil or cmp == nil then
	return
end

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
