local config = {}

-- general key mapping setup
config.key_attach = function(buf)
	local function buf_set_keymap(mode, lhs, rhs)
		vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = buf })
	end
	require("shortcut").map_lsp(buf_set_keymap)
end

-- cancel default formatting functions, using plugins
config.disable_format = function(client)
	if vim.fn.has("nvim-0.8") == 1 then
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = false
	else
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
end

-- capabilities setting
config.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- debouncing
config.flags = {
	debounce_text_changes = 150,
}

return config
