-- Configure Treesitter for syntax highlighting and indentation

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"c",
				"cpp",
				"c_sharp",
				"lua",
				"rust",
				"python",
				"go",
				"java",
				"bash",
				"markdown",
				"html",
				"css",
				"javascript",
				"typescript",
				"sql",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
