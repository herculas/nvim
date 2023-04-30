local comment = require_plugin("Comment")
if comment == nil then
	return
end

comment.setup({
	mappings = {
		extra = false,
	},
	toggler = { -- NORMAL
		line = "gcc",
		block = "gbc",
	},
	opleader = { -- VISUAL
		line = "gc",
		block = "gb",
	},
	pre_hook = nil,
	post_hook = nil,
})
