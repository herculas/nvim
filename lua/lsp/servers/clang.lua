local common = require("lsp.config")

local options = {
	capabilities = common.capabilities,
	flags = common.flags,
	on_attach = function(client, bufnr)
		common.disable_format(client)
		common.key_attach(bufnr)
	end,
}

return {
	on_setup = function(server)
		server.setup(options)
	end,
}
