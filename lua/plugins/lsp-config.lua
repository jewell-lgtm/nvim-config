return {
	{
		"williamboman/mason.nvim",
		config = function() end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function() end,
		{
			"neovim/nvim-lspconfig",
			config = function()
				local cmp_capabilities = require("cmp_nvim_lsp").default_capabilities()

				require("mason").setup({})
				require("mason-lspconfig").setup({
					ensure_installed = {
						"lua_ls",
						"tsserver",
						"kotlin_language_server",
					},
				})
				require("lspconfig").lua_ls.setup({
          capabilities = cmp_capabilities
        })
				require("lspconfig").tsserver.setup({
          capabilities = cmp_capabilities
        })
				require("lspconfig").kotlin_language_server.setup({
          capabilities = cmp_capabilities
        })
				-- Global mappings.
				-- See `:help vim.diagnostic.*` for documentation on any of the below functions
				vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float)
				vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
				vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
				vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

				-- Use LspAttach autocommand to only map the following keys
				-- after the language server attaches to the current buffer
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("UserLspConfig", {}),
					callback = function(ev)
						-- Enable completion triggered by <c-x><c-o>
						vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

						-- Buffer local mappings.
						-- See `:help vim.lsp.*` for documentation on any of the below functions
						local opts = { buffer = ev.buf }
						vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
						vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
						vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
						vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
						vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
						vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts)
						vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, opts)
						vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
						vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					end,
				})
			end,
		},
	},
}
