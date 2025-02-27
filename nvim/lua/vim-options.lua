vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.g.mapleader = " "
vim.opt.cursorline = true  -- Enable highlighting of the current line
vim.opt.swapfile = false
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.smartindent = true
vim.opt.cmdheight = 0

vim.opt.listchars = {
  tab = "│ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  leadmultispace = "│" .. string.rep(" ", vim.opt.shiftwidth:get() - 1),
}
