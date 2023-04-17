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

local s = luasnip.snippet
local f = luasnip.function_node
local d = luasnip.dynamic_node
local i = luasnip.insert_node
local t = luasnip.text_node
local fmta = require("luasnip.extras.fmt").fmta

return {

	-- superscript
	s(
		{ trig = "([%w%)%]%}])'", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- subscript
	s(
		{ trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- subscript and superscript
	s(
		{ trig = "([%w%)%]%}])__", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>^{<>}_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = in_math_env }
	),

	-- text subscript
	s(
		{ trig = "sd", snippetType = "autosnippet", wordTrig = false },
		fmta("_{\\mathrm{<>}}", { d(1, get_visual) }),
		{ condition = in_math_env }
	),

	-- superscript shortcut
	-- Places the first alphanumeric character after the trigger into a superscript.
	s(
		{ trig = '([%w%)%]%}])"([%w])', regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		}),
		{ condition = in_math_env }
	),

	-- subscript shortcut
	-- Places the first alphanumeric character after the trigger into a subscript.
	s(
		{ trig = "([%w%)%]%}]):([%w])", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			f(function(_, snip)
				return snip.captures[2]
			end),
		}),
		{ condition = in_math_env }
	),

	-- Euler's number superscript shortcut
	s(
		{ trig = "([^%a])ee", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>e^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- zero subscript shortcut
	s(
		{ trig = "([%a%)%]%}])00", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("0"),
		}),
		{ condition = in_math_env }
	),

	-- minus one superscript shortcut
	s(
		{ trig = "([%a%)%]%}])11", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("-1"),
		}),
		{ condition = in_math_env }
	),

	-- j subscript shortcut (since jk triggers snippet jump forward)
	s(
		{ trig = "([%a%)%]%}])JJ", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("j"),
		}),
		{ condition = in_math_env }
	),

	-- plus superscript shortcut
	s(
		{ trig = "([%a%)%]%}])%+%+", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("+"),
		}),
		{ condition = in_math_env }
	),

	-- complement superscript
	s(
		{ trig = "([%a%)%]%}])CC", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("\\complement"),
		}),
		{ condition = in_math_env }
	),

	-- conjugate (star) superscript shortcut
	s(
		{ trig = "([%a%)%]%}])%*%*", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			t("*"),
		}),
		{ condition = in_math_env }
	),

	-- vector, i.e. \vec
	s(
		{ trig = "([^%a])vv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\vec{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- default unit vector with subscript, i.e. \unitvector_{}
	s(
		{ trig = "([^%a])ue", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\unitvector_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- unit vector with hat, i.e. \uvec{}
	s(
		{ trig = "([^%a])uv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\uvec{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- matrix, i.e. \vec
	s(
		{ trig = "([^%a])mt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\mat{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- fraction
	s(
		{ trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\frac{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
			i(2),
		}),
		{ condition = in_math_env }
	),

	-- angle
	s(
		{ trig = "([^%a])gg", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\ang{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- absolute value
	s(
		{ trig = "([^%a])aa", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
		fmta("<>\\abs{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- square root
	s(
		{ trig = "([^%\\])sq", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\sqrt{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- binomial symbol
	s(
		{ trig = "([^%\\])bnn", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\binom{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = in_math_env }
	),

	-- logarithm with base subscript
	s(
		{ trig = "([^%a%\\])ll", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\log_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		}),
		{ condition = in_math_env }
	),

	-- derivative with denominator only
	s(
		{ trig = "([^%a])dV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\dvOne{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- derivative with numerator and denominator
	s(
		{ trig = "([^%a])dvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\dv{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = in_math_env }
	),

	-- derivative with numerator, denominator, and higher-order argument
	s(
		{ trig = "([^%a])ddv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\dvN{<>}{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
			i(3),
		}),
		{ condition = in_math_env }
	),

	-- partial derivative with denominator only
	s(
		{ trig = "([^%a])pV", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\pdvOne{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	-- partial derivative with numerator and denominator
	s(
		{ trig = "([^%a])pvv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\pdv{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = in_math_env }
	),

	-- partial derivative with numerator, denominator, and higher-order argument
	s(
		{ trig = "([^%a])ppv", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\pdvN{<>}{<>}{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
			i(3),
		}),
		{ condition = in_math_env }
	),

	-- sum with lower limit
	s(
		{ trig = "([^%a])sM", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\sum_{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
		}),
		{ condition = in_math_env }
	),

	-- sum with upper and lower limit
	s(
		{ trig = "([^%a])smm", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\sum_{<>}^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = in_math_env }
	),

	-- integral with upper and lower limit
	s(
		{ trig = "([^%a])intt", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\int_{<>}^{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			i(1),
			i(2),
		}),
		{ condition = in_math_env }
	),

	-- boxed command
	s(
		{ trig = "([^%a])bb", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
		fmta("<>\\boxed{<>}", {
			f(function(_, snip)
				return snip.captures[1]
			end),
			d(1, get_visual),
		}),
		{ condition = in_math_env }
	),

	----------------------------------------
	-- static math snippets
	----------------------------------------

	-- differential, i.e. \diff
	s({ trig = "df", priority = 2000, snippetType = "autosnippet" }, {
		t("\\diff"),
	}, { condition = in_math_env }),

	-- basic integral symbol, i.e. \int
	s({ trig = "in1", snippetType = "autosnippet" }, {
		t("\\int"),
	}, { condition = in_math_env }),

	-- double integral, i.e. \iint
	s({ trig = "in2", snippetType = "autosnippet" }, {
		t("\\iint"),
	}, { condition = in_math_env }),

	-- triple integral, i.e. \iiint
	s({ trig = "in3", snippetType = "autosnippet" }, {
		t("\\iiint"),
	}, { condition = in_math_env }),

	-- closed single integral, i.e. \oint
	s({ trig = "oi1", snippetType = "autosnippet" }, {
		t("\\oint"),
	}, { condition = in_math_env }),

	-- closed double integral, i.e. \oiint
	s({ trig = "oi2", snippetType = "autosnippet" }, {
		t("\\oiint"),
	}, { condition = in_math_env }),

	-- gradient operator, i.e. \grad
	s({ trig = "gdd", snippetType = "autosnippet" }, {
		t("\\grad "),
	}, { condition = in_math_env }),

	-- curl operator, i.e. \curl
	s({ trig = "cll", snippetType = "autosnippet" }, {
		t("\\curl "),
	}, { condition = in_math_env }),

	-- divergence operator, i.e. \divergence
	s({ trig = "DI", snippetType = "autosnippet" }, {
		t("\\div "),
	}, { condition = in_math_env }),

	-- laplacian operator, i.e. \laplacian
	s({ trig = "laa", snippetType = "autosnippet" }, {
		t("\\laplacian "),
	}, { condition = in_math_env }),

	-- parallel symbol, i.e. \parallel
	s({ trig = "||", snippetType = "autosnippet" }, {
		t("\\parallel"),
	}),

	-- cdots, i.e. \cdots
	s({ trig = "cdd", snippetType = "autosnippet" }, {
		t("\\cdots"),
	}),

	-- ldots, i.e. \ldots
	s({ trig = "ldd", snippetType = "autosnippet" }, {
		t("\\ldots"),
	}),

	-- equiv, i.e. \equiv
	s({ trig = "eqq", snippetType = "autosnippet" }, {
		t("\\equiv "),
	}),

	-- setminus, i.e. \setminus
	s({ trig = "stm", snippetType = "autosnippet" }, {
		t("\\setminus "),
	}),

	-- subset, i.e. \subset
	s({ trig = "sbb", snippetType = "autosnippet" }, {
		t("\\subset "),
	}),

	-- approx, i.e. \approx
	s({ trig = "px", snippetType = "autosnippet" }, {
		t("\\approx "),
	}, { condition = in_math_env }),

	-- propto, i.e. \propto
	s({ trig = "pt", snippetType = "autosnippet" }, {
		t("\\propto "),
	}, { condition = in_math_env }),

	-- colon, i.e. \colon
	s({ trig = "::", snippetType = "autosnippet" }, {
		t("\\colon "),
	}),

	-- implies, i.e. \implies
	s({ trig = ">>", snippetType = "autosnippet" }, {
		t("\\implies "),
	}),

	-- dot product, i.e. \cdot
	s({ trig = ",.", snippetType = "autosnippet" }, {
		t("\\cdot "),
	}),

	-- cross product, i.e. \times
	s({ trig = "xx", snippetType = "autosnippet" }, {
		t("\\times "),
	}),
}
