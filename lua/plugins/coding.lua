return {
  {
    'danymat/neogen',
    keys = {
      {
        '<leader>cc',
        function()
          require('neogen').generate {}
        end,
        desc = 'Neogen Comment',
      },
    },
    opts = { snippet_engine = 'luasnip' },
  },

  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },

  {
    'smjonas/inc-rename.nvim',
    cmd = 'IncRename',
    config = true,
  },

  {
    'echasnovski/mini.bracketed',
    event = 'BufReadPost',
    config = function()
      local bracketed = require 'mini.bracketed'
      bracketed.setup {}
    end,
  },
}
