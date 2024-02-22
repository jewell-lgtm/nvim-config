return {
    "NvChad/nvterm",
    config = function()
      require("nvterm").setup()

      local terminal = require("nvterm.terminal")

      vim.keymap.set('n', '<leader>th', function() require('nvterm.terminal').toggle('horizontal') end, {noremap = true, silent = true})

    end,
  }
