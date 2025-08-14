return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
	},

	{
		"neovim/nvim-lspconfig",
		dependencies = { "mason-org/mason-lspconfig.nvim" },
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"omnisharp",
					"pyright",
					"bashls",
					"marksman",
					"texlab",
					"cssls",
					"html",
					"ts_ls",
					"sqls",
					"gopls",
					"jdtls",
				},
				automatic_installation = true,
			})

			local lspconfig = require("lspconfig")

			local on_attach = function(_, bufnr)
				local opts = { noremap = true, silent = true, buffer = bufnr }

				-- Show hover documentation (e.g., function signature, variable info)
				-- Triggered with Shift+K in normal mode
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

				-- Jump to the definition of the symbol under the cursor
				-- Triggered with 'gd' (go to definition)
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

				-- Show available code actions (e.g., quick fix, organize imports, refactor)
				-- Triggered with <leader>ca (e.g., space + c + a)
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

				-- Format buffer
				vim.keymap.set("n", "<leader>gf", function()
					vim.lsp.buf.format({ async = true })
				end, opts)

				-- Optional: Format on save
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					callback = function()
						vim.lsp.buf.format()
					end,
				})
			end

			local servers = {
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = { library = vim.api.nvim_get_runtime_file("", true) },
						},
					},
				},
				rust_analyzer = { settings = { ["rust-analyzer"] = {} } },
				clangd = {},
				omnisharp = {},
				pyright = {},
				bashls = {},
				marksman = {},
				texlab = {},
				cssls = {},
				html = {},
				ts_ls = {},
				sqls = {},
				gopls = {},
				jdtls = {},
			}

			for server_name, config in pairs(servers) do
				config.on_attach = on_attach
				lspconfig[server_name].setup(config)
			end
		end,
	},
}
