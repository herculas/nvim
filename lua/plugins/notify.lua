local notify = require_plugin("notify")
if notify == nil then
	return
end

notify.setup({
	stages = "fade_in_slide_out",
	timeout = 3500,
})

vim.notify = notify
