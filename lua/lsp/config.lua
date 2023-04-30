local cmp_nvim_lsp = require_plugin("cmp_nvim_lsp")
if cmp_nvim_lsp == nil then
	return
end

local M = {}

-- cancel default formatting functions
M.disable_format = function(client)
	client.server_capabilities.documentFormattingProvider = false
	client.server_capabilities.documentRangeFormattingProvider = false
end

-- general LSP keymaps
M.key_attach = function(bufnr)
	local opts = {
		noremap = true,
		silent = true,
		buffer = bufnr,
	}

	keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>", opts)
	keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	keymap("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	keymap("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	keymap("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
end

-- capability settings
M.capabilities = cmp_nvim_lsp.default_capabilities()

-- debounce
M.flags = {
	debounce_text_changes = 150,
}

return M
