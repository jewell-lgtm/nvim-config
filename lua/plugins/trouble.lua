return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	},
	config = function()
		require("trouble").setup({})
		local keymap = vim.keymap.set
		local opts = { silent = true, noremap = true }

		keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
		keymap("n", "<leader>xq", "<cmd>TroubleClose<cr>", opts)
		keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
		keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
		keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
		keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
		keymap("n", "]t", "<cmd>TroubleNext<cr>", opts)
		keymap("n", "[t", "<cmd>TroublePrev<cr>", opts)
	end,
}
