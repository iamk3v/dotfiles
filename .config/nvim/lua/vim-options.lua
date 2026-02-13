vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.number = true
vim.g.mapleader = " "
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.swapfile = false
vim.opt.scrolloff = 10
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.smartindent = true
vim.opt.cmdheight = 0
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.winborder = "rounded"
vim.opt.colorcolumn = "80"

vim.opt.listchars = {
  tab = "│ ",
  trail = "·",
  extends = "»",
  precedes = "«",
  leadmultispace = "│" .. string.rep(" ", vim.opt.shiftwidth:get() - 1),
}

-- Sets colors for cursorLine, all other lines and visual highlight
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#FFFFFF", bg = "NONE", bold = true })
vim.api.nvim_set_hl(0, "CursorLine", { bg = "NONE" }) -- Remove background from the entire line
vim.api.nvim_set_hl(0, "LineNr", { fg = "#DEAFAE", bold = false })
vim.api.nvim_set_hl(0, "Visual", { bg = "#515051", fg = "NONE" })
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#515051" })

-- Auto reload aerospace on save
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = { "aerospace.toml" },
  command = "!aerospace reload-config",
})
