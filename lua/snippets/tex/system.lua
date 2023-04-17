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
local d = luasnip.dynamic_node
local i = luasnip.insert_node

local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

	-- annotate (custom command for annotating equation derivations)
	s(
		{ trig = "ann", snippetType = "autosnippet" },
		fmta(
			[[
      \annotate{<>}{<>}
      ]],
			{
				i(1),
				d(2, get_visual),
			}
		)
	),

	-- reference
	s(
		{ trig = " RR", snippetType = "autosnippet", wordTrig = false },
		fmta(
			[[
      ~\ref{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),

	-- documentclass
	s(
		{ trig = "dcc", snippetType = "autosnippet" },
		fmta(
			[[
      \documentclass[<>]{<>}
      ]],
			{
				i(1, "a4paper"),
				i(2, "article"),
			}
		),
		{ condition = line_begin }
	),

	-- use a latex package
	s(
		{ trig = "pack", snippetType = "autosnippet" },
		fmta(
			[[
      \usepackage{<>}
      ]],
			{
				d(1, get_visual),
			}
		),
		{ condition = line_begin }
	),

	-- input a latex file
	s(
		{ trig = "inn", snippetType = "autosnippet" },
		fmta(
			[[
      \input{<>}
      ]],
			{
				i(1),
			}
		),
		{ condition = line_begin }
	),

	-- label
	s(
		{ trig = "lbl", snippetType = "autosnippet" },
		fmta(
			[[
      \label{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),

	-- hphantom
	s(
		{ trig = "hpp", snippetType = "autosnippet" },
		fmta(
			[[
      \hphantom{<>}
      ]],
			{
				d(1, get_visual),
			}
		)
	),

	s(
		{ trig = "nc" },
		fmta([[\newcommand{<>}{<>}]], {
			i(1),
			i(2),
		}),
		{ condition = line_begin }
	),

	s(
		{ trig = "url" },
		fmta([[\url{<>}]], {
			d(1, get_visual),
		})
	),

	-- vspace
	s(
		{ trig = "vs" },
		fmta([[\vspace{<>}]], {
			d(1, get_visual),
		})
	),

	-- chapter
	s(
		{ trig = "h1", snippetType = "autosnippet" },
		fmta([[\chapter{<>}]], {
			d(1, get_visual),
		})
	),

	-- section
	s(
		{ trig = "h2", snippetType = "autosnippet" },
		fmta([[\section{<>}]], {
			d(1, get_visual),
		})
	),

	-- subsection
	s(
		{ trig = "h3", snippetType = "autosnippet" },
		fmta([[\subsection{<>}]], {
			d(1, get_visual),
		})
	),

	-- subsubsection
	s(
		{ trig = "h4", snippetType = "autosnippet" },
		fmta([[\subsubsection{<>}]], {
			d(1, get_visual),
		})
	),
}
