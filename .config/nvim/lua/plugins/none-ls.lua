return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvimtools/none-ls-extras.nvim", -- for eslint
		},
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					-- Lua
					null_ls.builtins.formatting.stylua,

					-- C, C++
					null_ls.builtins.formatting.clang_format.with({
						extra_args = { [[--style={"BasedOnStyle":"LLVM","BreakBeforeBraces":"Allman"}]] },
					}),

					-- C#
					null_ls.builtins.formatting.csharpier,

					-- Python
					null_ls.builtins.formatting.yapf.with({
						extra_args = { "--style", "{based_on_style: llvm}" },
					}),

					-- Go
					null_ls.builtins.formatting.gofmt,

					-- Java
					null_ls.builtins.formatting.google_java_format,

					-- Bash
					null_ls.builtins.formatting.shfmt,

					-- Markdown, HTML, CSS, JS/TS
					null_ls.builtins.formatting.prettier.with({
						filetypes = {
							"markdown",
							"html",
							"css",
							"javascript",
							"typescript",
						},
					}),

					-- SQL
					null_ls.builtins.formatting.sqlfluff.with({
						extra_args = { "--dialect", "postgres" }, -- adjust as needed
					}),

					-- Completion
					null_ls.builtins.completion.spell,

					-- JS/TS linting
					require("none-ls.diagnostics.eslint"),
				},
			})

			-- Format current buffer with <leader>gf
			vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
		end,
	},
}
