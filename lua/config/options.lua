-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Global variables
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"
vim.g.lazyvim_prettier_needs_config = true
-- vim.g.snacks_animate = false

-- Global options
vim.o.breakindent = true
vim.o.foldlevel = 999
vim.o.iskeyword = "@,48-57,192-255"
vim.o.lines = 40
-- vim.o.mouse = "v"
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 999
vim.o.signcolumn = "auto:2-3"
vim.o.spell = false
vim.o.virtualedit = "all"
vim.o.wrap = true
