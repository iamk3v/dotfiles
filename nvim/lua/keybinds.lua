-- Keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move lines down in visual
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move lines up in visual

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Search and replace current word

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Keep cursor on the center of the screen when half paging down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Keep cursor on the center of the screen when half paging up
vim.keymap.set("n", "n", "nzzzv")       -- Keep cursor on the center of the screen when going to next word in search
vim.keymap.set("n", "N", "Nzzzv")       -- Keep cursor on the center of the screen when going to previous word in search

vim.keymap.set("x", "<leader>p", "\"_dP") -- When copying foo and pasting over bar, keep foo in buffer instead of bar

vim.keymap.set({"n", "v"}, "<leader>y", [["+y]]) -- Copy to global clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]])        -- Copy to global clipboard

--vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
--vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
--vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
--vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

