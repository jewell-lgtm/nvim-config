return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
        local config = require("nvim-treesitter.configs")

        config.setup({
            ensure_installed = {"lua", "vim", "html", "css", "javascript", "typescript", "svelte", "json"},
            highlight = { enable = true },
            indent = { enable = true },
            auto_install = true
        })

    end
}
