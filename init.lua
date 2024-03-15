vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.scrolloff = 8

vim.opt.smartindent = true

vim.opt.clipboard = 'unnamedplus'

vim.opt.wrap = false

vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'W', ':w<CR>')
vim.keymap.set('n', 'Q', ':q<CR>')

vim.opt.termguicolors = true

-- Initialize the timer
local idle_timer = vim.loop.new_timer()

-- Function to start or restart the idle timer
local function reset_idle_timer()
  idle_timer:stop()
  idle_timer:start(
    5000,
    0,
    vim.schedule_wrap(function()
      -- Switch to normal mode if in insert or normal mode
      local mode = vim.api.nvim_get_mode().mode
      if mode == 'i' or mode == 'n' then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, false, true), 'n', false)
      end
    end)
  )
end

-- Auto-command to reset the timer on entering insert or normal mode
vim.api.nvim_create_autocmd({ 'InsertEnter', 'CursorMoved', 'CursorMovedI' }, {
  callback = function()
    reset_idle_timer()
  end,
})

-- Stop the timer on leaving insert mode to prevent mode changes
vim.api.nvim_create_autocmd('InsertLeave', {
  callback = function()
    idle_timer:stop()
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup 'plugins'
