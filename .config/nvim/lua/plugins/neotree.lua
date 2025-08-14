-- Configure Neo-tree file explorer plugin

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {
		filesystem = {
			follow_current_file = { enabled = true },
			use_libuv_file_watcher = true,
		},
	},
	config = function(_, opts)
		require("neo-tree").setup(opts)
		vim.keymap.set("n", "<C-o>", "<Cmd>Neotree reveal<CR>")
	end,
}
