vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 10

vim.opt.shiftwidth = 8
vim.opt.tabstop = 8
vim.opt.softtabstop = 8
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.showmatch = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = true
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.fillchars = { eob = " " }

local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == false then vim.fn.mkdir(undodir) end

vim.opt.undofile = true
vim.opt.autoread = true


vim.opt.backspace = "indent,eol,start"
