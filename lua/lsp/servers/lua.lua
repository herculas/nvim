local runtime_path = vim.split(package.path, ";")

table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local config = require("lsp.config")

local options = {
  capabilities = config.capabilities,
  flags = config.flags,
  on_attach = function(client, buf)
    config.disable_format(client)
    config.key_attach(buf)
  end,

  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

return {
  on_setup = function(server)
    require("neodev").setup()
    server.setup(options)
  end,
}
