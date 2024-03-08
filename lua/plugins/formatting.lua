return {
  {
    'stevearc/conform.nvim',
    lazy = true,
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {},
    config = function()
      require('conform').setup {
        formatters_by_ft = {
          lua = { 'stylua' },
          javascript = { { 'prettierd', 'prettier' } },
          javascriptreact = { { 'prettierd', 'prettier' } },
          typescript = { { 'prettierd', 'prettier' } },
          typescriptreact = { { 'prettierd', 'prettier' } },
          css = { { 'prettierd', 'prettier' } },
          json = { { 'prettierd', 'prettier' } },
          jsonc = { { 'prettierd', 'prettier' } },
          yaml = { { 'prettierd', 'prettier' } },
          svelte = { { 'prettierd', 'prettier' } },
          vue = { { 'prettierd', 'prettier' } },
          html = { { 'prettierd', 'prettier' } },
          graphql = { { 'prettierd', 'prettier' } },
        },
      }

      require('conform').setup {
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 1000,
          async = false,
          lsp_fallback = true,
        },
      }

      vim.keymap.set({ 'n', 'v' }, '<leader>cf', function()
        require('conform').format {
          lsp_fallback = true,
          async = false,
        }
      end, { desc = '[C]ode [F]ormat' })
    end,
  },
}
