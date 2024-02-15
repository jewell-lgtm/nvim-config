

-- Project (view,file,grep,tree) type commands
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
-- vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
-- vim.keymap.set("n", "<leader>pt", ":Neotree toggle<CR>", {})

-- Window/Paging
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
