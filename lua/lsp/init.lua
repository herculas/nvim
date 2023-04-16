local mason = require_plugin("mason")
local mason_config = require_plugin("mason-lspconfig")
local lsp_config = require_plugin("lspconfig")

if mason == nil or mason_config == nil or lsp_config == nil then
	return
end

-- mason configurations
mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig settings
-- mason-lspconfig uses the `lspconfig` server name in the APIs it exposes, not the package name `mason.nvim`
mason_config.setup({
	ensure_installed = {
		"lua_ls", -- Lua
		"bashls", -- bash script
		"jsonls", -- JSON
		"pyright", -- Python
		"rust_analyzer", -- Rust
		"taplo", -- TOML
		"yamlls", -- YAML
		"clangd", -- C/C++
	},
})

-- concrete setting for language servers
-- { key: server_name, value: config_file_name }
-- the key field should be element specified in williamboman/nvim-lsp-installer
local servers = {
	lua_ls = require("lsp.servers.lua"),
}

for name, config in pairs(servers) do
	if config ~= nil and type(config) == "table" then
		config.on_setup(lsp_config[name])
	else
		lsp_config[name].setup({})
	end
end

require("lsp.ui")
require("lsp.complete")
