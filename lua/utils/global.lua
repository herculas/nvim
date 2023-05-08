-- keymap bindings
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

-- plugin protected checking
function _G.require_plugin(name)
	local status, plugin = pcall(require, name)
	if not status then
		vim.notify("[Plugins] " .. name .. " not found!", vim.log.levels.ERROR)
		return nil
	end
	return plugin
end
