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
local in_math_env = helpers.in_math_env
local in_text_env = helpers.in_text_env

local s = luasnip.snippet
local f = luasnip.function_node
local d = luasnip.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

return {

	-- typewriter i.e. \texttt
	s(
		{
			trig = "([^%a])sd",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
			priority = 2000,
		},
		fmta("<>\\texttt{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{
			condition = in_text_env,
		}
	),

	-- italic i.e. \textit
	s(
		{
			trig = "([^%a])tii",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\textit{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- bold i.e. \textbf
	s(
		{
			trig = "tbb",
			snippetType = "autosnippet",
		},
		fmta("\\textbf{<>}", {
			d(1, get_visual),
		})
	),

	-- math roman i.e. \mathrm
	s(
		{
			trig = "([^%a])rmm",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\mathrm{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- math caligraphy i.e. \mathcal
	s(
		{
			trig = "([^%a])mcc",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\mathcal{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- math boldface i.e. \mathbf
	s(
		{
			trig = "([^%a])mbf",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\mathbf{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- math blackboard i.e. \mathbb
	s(
		{
			trig = "([^%a])mbb",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\mathbb{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- regular text i.e. \text (in math environments)
	s(
		{
			trig = "([^%a])tee",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>\\text{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{
			condition = in_math_env,
		}
	),
}
