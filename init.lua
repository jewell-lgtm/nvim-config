require("config.options")
require("config.lazy")
require("config.colorscheme")

-- Set a transparent background
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
