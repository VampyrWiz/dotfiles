return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- options: latte, frappe, macchiato, mocha
      background = {     -- map background to flavours
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        keywords = { "bold" },
        functions = { "italic", "bold" },
        variables = {},
        -- customize more groups if you want
      },
      integrations = {
        -- enable integrations with other plugins here if needed
        -- e.g. nvimtree = true, telescope = true, etc.
      },
    })

    vim.cmd("colorscheme catppuccin")
  end,
}
