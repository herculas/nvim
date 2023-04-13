local config = require("lsp.config")

local options = {
  capabilities = config.capabilities,
  flags = config.flags,
  on_attach = function(client, buf)
    config.disable_format(client)
    config.key_attach(buf)
  end,
}

return {
  on_setup = function(server)
    server.setup(options)
  end,
}
