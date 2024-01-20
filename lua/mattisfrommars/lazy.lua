local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = { {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
}, {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
}, {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = {
				"c",
				"lua",
				"vim",
				"vimdoc",
				"query",
				"elixir",
				"heex",
				"javascript",
				"html",
				"go",
				"kotlin",
				"java",
				"rust",
				"typescript",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
} }

local opts = {}

require("lazy").setup(plugins, opts)

require("catppuccin").setup()
vim.cmd.colorscheme"catppuccin"
