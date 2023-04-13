local config = require("config")

if config.nvim_tree_keys == nil or not config.flags.enable_nvim_tree then
  return
end

local nvim_tree = require_plugin("nvim-tree")
local nvim_tree_keys = config.nvim_tree_keys

-- NORMAL: nvim-tree toggle
keymap("n", nvim_tree_keys.toggle, ":NvimTreeToggle<CR>", { noremap = true, silent = true })

local list_keys = {
  { key = nvim_tree_keys.edit, action = "edit" },
  { key = nvim_tree_keys.system_open, action = "system_open" },
  { key = nvim_tree_keys.vsplit, action = "vsplit" },
  { key = nvim_tree_keys.hsplit, action = "split" },
  { key = nvim_tree_keys.toggle_git_ignored, action = "toggle_git_ignored" },
  { key = nvim_tree_keys.toggle_dot_files, action = "toggle_dotfiles" },
  { key = nvim_tree_keys.toggle_custom, action = "toggle_custom" },
  { key = nvim_tree_keys.refresh, action = "refresh" },
  { key = nvim_tree_keys.create, action = "create" },
  { key = nvim_tree_keys.remove, action = "remove" },
  { key = nvim_tree_keys.rename, action = "rename" },
  { key = nvim_tree_keys.cut, action = "cut" },
  { key = nvim_tree_keys.copy, action = "copy" },
  { key = nvim_tree_keys.paste, action = "paste" },
  { key = nvim_tree_keys.copy_name, action = "copy_name" },
  { key = nvim_tree_keys.copy_path, action = "copy_path" },
  { key = nvim_tree_keys.copy_absolute_path, action = "copy_absolute_path" },
  { key = nvim_tree_keys.toggle_file_info, action = "toggle_file_info" },
  { key = nvim_tree_keys.tabnew, action = "tabnew" },
  { key = nvim_tree_keys.cd, action = "cd" },
  { key = nvim_tree_keys.dir_up, action = "dir_up" },
}

-- nvim-tree setup configuration
nvim_tree.setup({
  disable_netrw = true,                                     -- completely disable netrw
  git = { enable = false, },                                -- do not display git status icon
  update_cwd = true,                                        -- project plugin settings
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  filters = {                                               -- file display filters:
    dotfiles = true,                                        --      hide dot files
  },
  view = {                                                  -- view settings:
    width = 34,                                             --      width of the panel
    side = "left",                                          --      display position
    hide_root_folder = false,                               --      hide the root directory
    mappings = {                                             -- key settings
      custom_only = true,
      list = list_keys,
    },
    number = false,                                         -- not display line numbers
    relativenumber = false,
    signcolumn = "yes",                                     -- display icons
  },
  actions = {
    open_file = {
      resize_window = true,                                 -- resize the panel at first opening
      quit_on_open = false,                                 -- close the panel after opening new files
    },
  },
  system_open = {
    cmd = "open",                                           -- open file in MacOS
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "after",
    },
  },
})
