local dashboard = require_plugin("dashboard")
if dashboard == nil then
	return
end

local header_option_1 = {
	[[                                                      ]],
	[[                                                      ]],
	[[ ███╗   ██╗ ███████╗ ███╗   ██╗ ███╗   ███╗ ███╗   ██╗]],
	[[ ████╗  ██║ ██╔════╝ ████╗  ██║ ████╗ ████║ ████╗  ██║]],
	[[ ██╔██╗ ██║ ███████╗ ██╔██╗ ██║ ██╔████╔██║ ██╔██╗ ██║]],
	[[ ██║╚██╗██║ ╚════██║ ██║╚██╗██║ ██║╚██╔╝██║ ██║╚██╗██║]],
	[[ ██║ ╚████║ ███████║ ██║ ╚████║ ██║ ╚═╝ ██║ ██║ ╚████║]],
	[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═╝  ╚═══╝ ╚═╝     ╚═╝ ╚═╝  ╚═══╝]],
	[[                                                      ]],
	[[                                                      ]],
}

local footer_option_1 = {
	"",
	"",
	"  https://github.com/wurahara",
}

dashboard.setup({
	config = {
		header = header_option_1,
		shortcut = {
			{
				icon = " ",
				desc = "Update",
				group = "@property",
				action = "PackerSync",
				key = "u",
			},
			{
				icon = " ",
				icon_hl = "@available",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				icon = " ",
				desc = "History",
				group = "Number",
				action = "Telescope oldfiles",
				key = "h",
			},
			{
				icon = "󰲋 ",
				desc = "Projects",
				action = "Telescope projects",
				key = "o",
			},
		},
		footer = footer_option_1,
	},
})
