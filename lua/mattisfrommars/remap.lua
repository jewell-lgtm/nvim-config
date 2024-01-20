local builtin = require("telescope.builtin")

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})
