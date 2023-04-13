-- plugin checking
function _G.require_plugin(name)
  local status, plugin = pcall(require, name)
  if not status then
    vim.notify("[Plugins] not found: " .. name)
    return nil
  end
  return plugin
end

-- LSP capability
function _G.lsp_cap()
  print(vim.inspect(vim.lsp.buf_get_clients()[1].resolved_capabilities))
end

-- logs
function _G.log(v)
  print(vim.inspect(v))
  return v
end

-- keymap setting shortcuts
function _G.keymap(mode, lhs, rhs, opts)
  if not (type(lhs) == "string") then
    return
  end
  if not (type(rhs) == "string") then
    return
  end
  opts = opts or {}
  local default_opts = {
    noremap = true,
    silent = true,
  }
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", default_opts, opts))
end
