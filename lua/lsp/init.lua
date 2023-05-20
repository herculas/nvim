local mason = require_plugin("mason")
local mason_config = require_plugin("mason-lspconfig")
local lsp_config = require_plugin("lspconfig")

if mason == nil or mason_config == nil or lsp_config == nil then
	return
end

-- mason configurations
mason.setup({
	ui = {
		border = "rounded",
		width = 0.6,
		height = 0.6,
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig configurations
mason_config.setup({
	ensure_installed = {
		"clangd",
		"lua_ls",
	},
})

-- concrete configurations for language servers
local servers = {
	lua_ls = require("lsp.servers.lua"),
	clangd = require("lsp.servers.clang"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		config.on_setup(lsp_config[name])
	else
		lsp_config[name].setup({})
	end
end

require("lsp.interface")
require("lsp.complete")
