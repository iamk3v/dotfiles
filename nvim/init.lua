local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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

require("vim-options")
require("lazy").setup("plugins")

-- Sets colors for cursorLine, all other lines and visual highlight
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg='#FFFFFF', bg='NONE',  bold=true })
vim.api.nvim_set_hl(0, 'CursorLine', { bg='NONE' })  -- Remove background from the entire line
vim.api.nvim_set_hl(0, 'LineNr', { fg='#DEAFAE', bold=false })
vim.api.nvim_set_hl(0, 'Visual', { bg='#515051', fg='NONE' })

-- Auto reload aerospace on save
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = { 'aerospace.toml' },
  command = '!aerospace reload-config',
})
