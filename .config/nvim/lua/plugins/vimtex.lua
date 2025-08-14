return {
	{
		"lervag/vimtex",
		lazy = false,
		ft = { "tex" },
		init = function()
			vim.g.vimtex_view_method = "general"
			vim.g.vimtex_view_general_viewer = "okular"
			vim.g.vimtex_view_general_options = [[--unique file:@pdf#src:@line@tex]]
			vim.g.vimtex_compiler_method = "latexmk"
			vim.g.vimtex_quickfix_mode = 0

			vim.g.vimtex_compiler_latexmk = {
				executable = "latexmk",
				options = {
					"-pdf",
					'-pdflatex="lualatex %O %S"',
					"-interaction=nonstopmode",
					"-synctex=1",
					"-file-line-error",
				},
			}

			-- Keymaps
			-- Stop compilation and clean aux files
			vim.keymap.set("n", "<leader>lc", function()
				-- Stop compilation if running
				vim.cmd("VimtexStop")
				-- Clean aux files
				vim.cmd("VimtexClean")
			end, { desc = "Stop and clean LaTeX aux files" })

			vim.keymap.set("n", "<leader>lC", function()
				vim.cmd("VimtexStop")
				vim.cmd("VimtexClean!")
			end, { desc = "Stop and clean LaTeX aux files + PDF" })

			vim.keymap.set("n", "<leader>ll", ":VimtexCompile<CR>", { desc = "Compile LaTeX file" })
		end,
	},
}
