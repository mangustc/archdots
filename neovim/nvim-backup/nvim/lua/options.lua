vim.o.guicursor = ""

vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "80"

vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

vim.o.wrap = false

vim.o.swapfile = false
vim.o.backup = false
vim.o.undodir = os.getenv("HOME") .. "/.local/share/nvim/undodir"
vim.o.undofile = true

vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.termguicolors = true

vim.o.scrolloff = 9
vim.o.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.o.updatetime = 100

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python_provider = 0
-- vim.g.loaded_netrwPlugin = 1
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwSettings = 1
-- vim.g.loaded_netrwFileHandlers = 1
-- vim.g.loaded_netrw_gitignore = 1
