local opt = vim.opt
local g = vim.g

g.mapleader = " "
g.autoformat = true

opt.number = true
opt.relativenumber = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.breakindent = true
opt.undofile = true
opt.cursorline = true
opt.whichwrap:append("[]<>hl")
opt.autowrite = true
opt.list = true
opt.scrolloff = 5
opt.shiftround = true
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
