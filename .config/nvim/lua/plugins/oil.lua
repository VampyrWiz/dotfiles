-- Configure Oil plugin for file management enhancements

return {
  'stevearc/oil.nvim',
  enabled = false,
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  lazy = false,
  config = function ()
    require("oil").setup()
  end
}