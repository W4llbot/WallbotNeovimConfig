vim.opt.number = true
vim.opt.cursorline = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.breakindent = false
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
vim.opt.colorcolumn = "80"
vim.opt.showmatch = true
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.showmode = false
vim.opt.conceallevel = 0
vim.opt.concealcursor = ""
vim.opt.fillchars = { eob = " " }

local undodir = vim.fn.stdpath("data") .. "/undodir"
if vim.fn.isdirectory(undodir) == false then vim.fn.mkdir(undodir) end

vim.opt.undofile = true
vim.opt.autoread = true

vim.opt.backspace = "indent,eol,start"

-- vim.diagnostic.config({
--         virtual_lines = true, -- Shows diagnostics on new lines below the code
--         virtual_text = false,  -- Usually best to disable virtual_text if using lines
-- })

