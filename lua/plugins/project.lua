local project = require_plugin("project_nvim")
if project == nil then
	return
end

project.setup({
	detection_methods = {
		"pattern",
	},
	patterns = {
		"README.md",
		"Cargo.toml",
		"package.json",
		".sln",
		".git",
		".svn",
		"Makefile",
		"CmakeLists.txt",
	},
})
