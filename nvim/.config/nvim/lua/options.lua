local opt = vim.opt
local g = vim.g

g.mapleader =' '
g.t_co = 256
g.background = "dark"
g.material_style = "palenight"

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

opt.mouse = 'a'
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.swapfile = false
opt.expandtab = true
opt.wrap = true
opt.hlsearch = false

opt.number = true
opt.numberwidth = 2
opt.relativenumber = true
opt.cursorline = true
opt.syntax = "ON"
opt.termguicolors = true
opt.showmode = false
opt.clipboard="unnamedplus"

vim.cmd 'colorscheme ayu'
