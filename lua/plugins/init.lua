local path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_bootstrap

-- automatically detect and install Packer.nvim
if vim.fn.empty(vim.fn.glob(path)) > 0 then
  vim.notify("[Plugins] Packer.nvim installing, please wait ...")
  packer_bootstrap = vim.fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    path,
  })
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("[Plugins] Packer.nvim installed.")
end

-- protected call to prevent error in the first use
local packer = require_plugin("packer")
if packer == nil then
  return
end

-- Packer.nvim setup
packer.startup({
  function(use)
    -- Packer.nvim: the package manager can manage itself
    use("wbthomason/packer.nvim")

    -- nvim-notify: override the default notification persentation
    use({
      "rcarriga/nvim-notify",
      config = function()
        require("plugins.notify")
      end,
    })

    -- colorscheme
    use({
      "Mofiqul/dracula.nvim",
      config = function()
        require("plugins.colorscheme")
      end,
    })

    -- lualine: footer
    use({
      "nvim-lualine/lualine.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons",
        "arkav/lualine-lsp-progress",
      },
      config = function()
        require("plugins.lualine")
      end,
    })

    -- nvim-tree: file explorer
    use({
      "nvim-tree/nvim-tree.lua",
      requires = "nvim-tree/nvim-web-devicons",
      config = function()
        require("plugins.tree")
      end,
    })

    -- bufferline: header for tabs
    use({
      "akinsho/bufferline.nvim",
      requires = {
        "nvim-tree/nvim-web-devicons",
        "moll/vim-bbye",
      },
      config = function()
        require("plugins.bufferline")
      end,
    })
  end,
  config = {
    max_jobs = 16, -- max jobs for concurrent setup
  }
})
