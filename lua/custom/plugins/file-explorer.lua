return {
  {
    'nvim-tree/nvim-tree.lua',
    cmd = { 'NvimTreeToggle', 'NvimTreeFocus' },
    config = function(_, opts)
      require('nvim-tree').setup(opts)

      vim.keymap.set('n', '<leader>p', '<cmd>NvimTreeToggle<CR>', { desc = 'Nvimtree Toggle window' })
    end,
  },
}
