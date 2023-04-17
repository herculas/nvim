local exports = {}

local luasnip = require_plugin("luasnip")

if luasnip == nil then
	return
end

local snippet_node = luasnip.snippet_node
local insert_node = luasnip.insert_node

function exports.get_ISO_8601_data()
	return os.date("%Y-%m-%d")
end

function exports.get_visual(_, parent)
	if #parent.snippet.env.SELECT_RAW > 0 then
		return snippet_node(nil, insert_node(1, parent.snippet.env.SELECT_RAW))
	else
		return snippet_node(nil, insert_node(1, ""))
	end
end

function exports.in_math_env()
	return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

function exports.in_text_env()
	return not exports.in_math_env()
end

return exports
