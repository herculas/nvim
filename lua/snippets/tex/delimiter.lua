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

return {

	-- left/right parentheses
	s(
		{
			trig = "([^%a])l%[",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\left[<>\\right]", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- left/right square braces
	s(
		{
			trig = "([^%a])l%[",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\left[<>\\right]", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- left/right curly braces
	s(
		{
			trig = "([^%a])l%{",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\left\\{<>\\right\\}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- big parentheses
	s(
		{
			trig = "([^%a])b%(",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\big(<>\\big)", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- big square braces
	s(
		{
			trig = "([^%a])b%[",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\big[<>\\big]", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- big curly braces
	s(
		{
			trig = "([^%a])b%{",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\big\\{<>\\big\\}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- escaped curly braces
	s(
		{
			trig = "([^%a])\\%{",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			priority = 2000,
		},
		fmta("<>\\{<>\\}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- quotation mark
	s(
		{
			trig = "``",
			snippetType = "autosnippet",
		},
		fmta("``<>''", {
			d(1, get_visual),
		})
	),
}
