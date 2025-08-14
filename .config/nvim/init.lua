-- Load Neovim options and keymaps
require("core.options")
require("core.keymaps")

-- Ensure lazy.nvim package manager is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load all plugin configurations using lazy.nvim
require("lazy").setup({
  require("plugins.themes"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require("plugins.neotree"),
  require("plugins.lualine"),
  require("plugins.vimtex"),
  require("plugins.mason"),
  require("plugins.none-ls"),
  require("plugins.alpha"),
  require("plugins.completions"),
  require("plugins.debugging"),
  require("plugins.bufferline"),
  require("plugins.comments"),
  require("plugins.oil"),
  require("plugins.multicursors"),
})
