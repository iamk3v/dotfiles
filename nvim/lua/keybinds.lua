-- Keymaps
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move lines down in visual" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move lines up in visual" })
vim.keymap.set("n", "<leader>w", "<C-w>", { desc = "Select next window" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace cursor word" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page up" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next search result" }) -- Keep cursor on the center of the screen when going to next word in search
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous search result" }) -- Keep cursor on the center of the screen when going to previous word in search

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without replacing clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard" })

vim.keymap.set("n", "H", "^", { desc = "Move to first non-blank character" })
vim.keymap.set("n", "L", "$", { desc = "Move to last non-blank character" })
-- vim.keymap.set("n", "J", "6j") -- Move 6 down
-- vim.keymap.set("n", "K", "6k") -- Move 6 up

vim.keymap.set("n", "<leader>i", "ciw", { desc = "Replace current word, insert" })
vim.keymap.set("n", "<leader>a", "caw", { desc = "Replace current word, append" })
vim.keymap.set("n", "<leader>d", "daw", { desc = "Delete current word" })

-- vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>") -- Exit terminal mode back to normal mode

-- Toggle autoformat on save
vim.keymap.set("n", "<leader>tf", function()
	vim.g.disable_autoformat = not vim.g.disable_autoformat
	if vim.g.disable_autoformat then
		vim.notify("Autoformatting disabled", vim.log.levels.INFO)
	else
		vim.notify("Autoformatting enabled", vim.log.levels.INFO)
	end
end, { desc = "Toggle autoformat on save" })
