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
local i = luasnip.insert_node

local rep = require("luasnip.extras").rep
local fmta = require("luasnip.extras.fmt").fmta
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

	-- generic environment
	s(
		{
			trig = "new",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \begin{<>}
          <>
        \end{<>}
      ]],
			{
				i(1),
				d(2, get_visual),
				rep(1),
			}
		),
		{
			condition = line_begin,
		}
	),

	-- environment with one extra argument
	s(
		{
			trig = "n2",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \begin{<>}{<>}
          <>
        \end{<>}
      ]],
			{
				i(1),
				i(2),
				d(3, get_visual),
				rep(1),
			}
		),
		{
			condition = line_begin,
		}
	),

	-- environment with two extra arguments
	s(
		{
			trig = "n3",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \begin{<>}{<>}{<>}
          <>
        \end{<>}
      ]],
			{
				i(1),
				i(2),
				i(3),
				d(4, get_visual),
				rep(1),
			}
		),
		{
			condition = line_begin,
		}
	),

	-- equation
	s(
		{
			trig = "nn",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \[
          <>
        \]
      ]],
			{
				i(1),
			}
		),
		{
			condition = line_begin,
		}
	),

	-- split equation
	s(
		{
			trig = "ss",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \begin{equation*}
          \begin{split}
            <>
          \end{split}
        \end{equation*}
      ]],
			{
				d(1, get_visual),
			}
		),
		{
			condition = line_begin,
		}
	),

	-- align
	s(
		{
			trig = "all",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \begin{align*}
          <>
        \end{align*}
      ]],
			{
				i(1),
			}
		),
		{
			condition = line_begin,
		}
	),

	-- itemize
	s(
		{
			trig = "itt",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \begin{itemize}
          \item <>
        \end{itemize}
      ]],
			{
				i(0),
			}
		),
		{
			condition = line_begin,
		}
	),

	-- enumerate
	s(
		{
			trig = "enn",
			snippetType = "autosnippet",
		},
		fmta(
			[[
        \begin{enumerate}
          \item <>
        \end{enumerate}
      ]],
			{
				i(0),
			}
		)
	),

	-- inline math
	s(
		{
			trig = "([^%l])mm",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("<>$<>$", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		})
	),

	-- inline math on new line
	s(
		{
			trig = "^mm",
			regTrig = true,
			wordTrig = false,
			snippetType = "autosnippet",
		},
		fmta("$<>$", {
			i(1),
		})
	),

	-- figure
	s(
		{
			trig = "fig",
		},
		fmta(
			[[
        \begin{figure}[htb!]
          \centering
          \includegraphics[width=<>\linewidth]{<>}
          \caption{<>}
          \label{fig:<>}
        \end{figure}
      ]],
			{
				i(1),
				i(2),
				i(3),
				i(4),
			}
		),
		{
			condition = line_begin,
		}
	),
}
