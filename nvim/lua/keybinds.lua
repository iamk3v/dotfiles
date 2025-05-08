-- Keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move lines down in visual
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move lines up in visual
vim.keymap.set("n", "<leader>w", "<C-w>") -- Map ctrl w to <leader> w

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Search and replace current word

vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Keep cursor on the center of the screen when half paging down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Keep cursor on the center of the screen when half paging up
vim.keymap.set("n", "n", "nzzzv") -- Keep cursor on the center of the screen when going to next word in search
vim.keymap.set("n", "N", "Nzzzv") -- Keep cursor on the center of the screen when going to previous word in search

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

vim.keymap.set("x", "<leader>p", '"_dP') -- When copying foo and pasting over bar, keep foo in buffer instead of bar

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]]) -- Copy to global clipboard
vim.keymap.set("n", "<leader>Y", [["+Y]]) -- Copy to global clipboard

vim.keymap.set("n", "H", "^") -- Move to start of line
vim.keymap.set("n", "L", "$") -- Move to end of line
-- vim.keymap.set("n", "J", "6j") -- Move 6 down
-- vim.keymap.set("n", "K", "6k") -- Move 6 up

vim.keymap.set("n", "<leader>i", "ciw") -- Replace cursor word
vim.keymap.set("n", "<leader>a", "caw") -- Replace cursor word
vim.keymap.set("n", "<leader>d", "daw") -- Delete cursor word

-- vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- Exit terminal mode back to normal mode

-- VimTex
vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>")
vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>")
vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>")
vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>")
vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>")
vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>")
vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<CR>")

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
