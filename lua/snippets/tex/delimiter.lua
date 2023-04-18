local luasnip = require_plugin("luasnip")
if luasnip == nil then
	return
end

local helpers = require("utils.luasnip-helper")
if helpers == nil then
	vim.notify("[SNIP] luasnip helper not found")
	return
end

local get_visual = helpers.get_visual

local s = luasnip.snippet
local f = luasnip.function_node
local d = luasnip.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

-- delemiters in LaTeX
return {

	s(
		{
			trig = "l1",
			name = "Parentheses",
			dscr = "Paired parentheses with automatic size",
		},
		fmta("<>\\left(<>\\right)", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	s(
		{
			trig = "l2",
			name = "Square Brackets",
			dscr = "Sqaure brackets with automatic size",
		},
		fmta("<>\\left[<>\\right]", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	s(
		{
			trig = "l3",
			name = "Curly Brackets",
			dscr = "Curly brackets with automatic size",
		},
		fmta("<>\\left\\{<>\\right\\}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	s(
		{
			trig = "b1",
			name = "Big Parentheses",
			dscr = "Paired parentheses with big size",
		},
		fmta("<>\\big(<>\\big)", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	s(
		{
			trig = "b2",
			name = "Big Square Brackets",
			dscr = "Sqaure brackets with big size",
		},
		fmta("<>\\big[<>\\big]", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	s(
		{
			trig = "b3",
			name = "Big Curly Brackets",
			dscr = "Curly brackets with big size",
		},
		fmta("<>\\big\\{<>\\big\\}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	s(
		{
			trig = "``",
			name = "Quotation Mark",
			dscr = "Quotation mark",
			snippetType = "autosnippet",
		},
		fmta("``<>''", {
			d(1, get_visual),
		})
	),
}
