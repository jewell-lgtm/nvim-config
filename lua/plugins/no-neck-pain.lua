return {
  {
    'shortcuts/no-neck-pain.nvim',
    version = '*',
    config = function()
      --
      vim.keymap.set('n', 'Z', ':NoNeckPain<CR>')
    end,
  },
}
