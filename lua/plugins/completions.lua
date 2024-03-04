return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      {
        'L3MON4D3/LuaSnip',
        build = (function()
          -- Build Step is needed for regex support in snippets
          -- This step is not supported in many windows environments
          -- Remove the below condition to re-enable on windows
          if vim.fn.has 'win32' == 1 then
            return
          end
          return 'make install_jsregexp'
        end)(),
      },
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',

      -- Adds a number of user-friendly snippets
      -- 'rafamadriz/friendly-snippets',
    },
    config = function()
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = {
          completeopt = 'menu,menuone,noinsert',
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<Cmd-Right>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          -- ['<Tab>'] = cmp.mapping(function(fallback)
          --     if cmp.visible() then
          --         cmp.select_next_item()
          --     elseif luasnip.expand_or_locally_jumpable() then
          --         luasnip.expand_or_jump()
          --     else
          --         fallback()
          --     end
          -- end, { 'i', 's' }),
          -- ['<S-Tab>'] = cmp.mapping(function(fallback)
          --     if cmp.visible() then
          --         cmp.select_prev_item()
          --     elseif luasnip.locally_jumpable(-1) then
          --         luasnip.jump(-1)
          --     else
          --         fallback()
          --     end
          -- end, { 'i', 's' }),
        },
        sources = {
          -- { name = 'copilot',  group_index = 2 },
          { name = 'nvim_lsp', group_index = 2 },
          { name = 'luasnip', group_index = 2 },
          { name = 'path', group_index = 2 },
        },
      }
    end,
  },
  {
    'github/copilot.vim',
  },

  -- {
  --     'zbirenbaum/copilot.lua',
  --     event = 'InsertEnter', -- Load the plugin when entering insert mode
  --     cmd = 'Copilot',   -- Ensure the plugin is loaded before the Copilot command is used
  --     config = function()
  --         require('copilot').setup {}
  --     end,
  -- },
  -- {
  --     'zbirenbaum/copilot-cmp',
  --     config = function()
  --         require('copilot_cmp').setup()
  --     end,
  -- },
}
