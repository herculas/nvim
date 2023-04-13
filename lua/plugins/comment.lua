local config = require("config")
local comment_keys = config.comment_keys

if not config.flags.enable_comment or comment_keys == nil then
	vim.notify("[Plugins] Comment disabled.")
	return
end

local comment = require_plugin("Comment")
if comment == nil then
	return
end

comment.setup({
	mappings = {
		extra = false,
	},
	toggler = {
		line = comment_keys.toggler.line,
		block = comment_keys.toggler.block,
	},
	opleader = {
		line = comment_keys.opleader.line,
		block = comment_keys.opleader.block,
	},
	pre_hook = nil,
	post_hook = nil,
})
