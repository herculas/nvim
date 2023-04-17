local luasnip = require_plugin("luasnip")
if luasnip == nil then
	return
end

local helpers = require("utils.luasnip-helper")
if helpers == nil then
	vim.notify("[SNIP] luasnip helper not found")
	return
end
local in_math_env = helpers.in_math_env

local s = luasnip.snippet
local t = luasnip.text_node
local line_begin = require("luasnip.extras.expand_conditions").line_begin

return {

	s({
		trig = "LL",
		snippetType = "autosnippet",
	}, {
		t("& "),
	}),

	s({
		trig = "q",
	}, {
		t("\\quad "),
	}),

	s({
		trig = "qq",
		snippetType = "autosnippet",
	}, {
		t("\\qquad "),
	}),

	s({
		trig = "npp",
		snippetType = "autosnippet",
	}, {
		t({ "\\newpage", "" }),
	}, {
		condition = line_begin,
	}),

	s({
		trig = "which",
		snippetType = "autosnippet",
	}, {
		t("\\text{ for which } "),
	}, {
		condition = in_math_env,
	}),

	s({
		trig = "all",
		snippetType = "autosnippet",
	}, {
		t("\\text{ for all } "),
	}, {
		condition = in_math_env,
	}),

	s({
		trig = "and",
		snippetType = "autosnippet",
	}, {
		t("\\quad \\text{and} \\quad"),
	}, {
		condition = in_math_env,
	}),

	s({
		trig = "forall",
		snippetType = "autosnippet",
	}, {
		t("\\text{ for all } "),
	}, {
		condition = in_math_env,
	}),

	s({
		trig = "toc",
		snippetType = "autosnippet",
	}, {
		t("\\tableofcontents"),
	}, {
		condition = line_begin,
	}),

	s({
		trig = "inff",
		snippetType = "autosnippet",
	}, {
		t("\\infty"),
	}),

	s({
		trig = "ii",
		snippetType = "autosnippet",
	}, {
		t("\\item "),
	}, {
		condition = line_begin,
	}),

	s({
		trig = "--",
		snippetType = "autosnippet",
	}, {
		t("% --------------------------------------------- %"),
	}, {
		condition = line_begin,
	}),

	-- hline with extra vertical space
	s({
		trig = "hl",
	}, {
		t("\\hline {\\rule{0pt}{2.5ex}} \\hspace{-7pt}"),
	}, {
		condition = line_begin,
	}),
}
