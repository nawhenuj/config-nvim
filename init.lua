-- line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- share universal clipboard
vim.opt.clipboard = "unnamedplus"

-- highlight current line
vim.opt.cursorline = true
vim.api.nvim_command('highlight Cursorline cterm=bold ctermbg=black')

-- smart case when searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- tabsize
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4

-- remap leader key
vim.g.mapleader = " "

-- remap navigation key
vim.api.nvim_set_keymap('n', '<leader>pv', ':Ex<CR>', { noremap = true, silent = true })

-- remap buffer keys
vim.api.nvim_set_keymap('n', '<leader>n', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>m', ':bprevious<CR>', { noremap = true, silent = true })

-- remap window keys
vim.api.nvim_set_keymap('n', '<leader>w', '<C-w>', { noremap = true, silent = true })

-- remap super case
vim.api.nvim_set_keymap('x', '<leader>p', '"_dP', { noremap = true, silent = true })

-- lazy.nvim
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

local opts = {}
require("lazy").setup("plugins", opts)
