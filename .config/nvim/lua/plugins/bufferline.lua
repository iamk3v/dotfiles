return {
	"akinsho/bufferline.nvim",
	dependencies = "nvim-tree/nvim-web-devicons",
	event = "BufWinEnter",
	config = function()
		local function close_buffer(bufnr)
			Snacks.bufdelete(bufnr)
		end

		require("bufferline").setup({
			options = {
				close_command = close_buffer,
				right_mouse_command = close_buffer,
				diagnostics = "nvim_lsp", -- Show LSP diagnostics
				separator_style = "thin", -- Style of separator (or "thick", "thin")
				show_close_icon = false, -- Hide global close icon
				show_buffer_close_icons = true, -- Show X button on each buffer
			},
		})
		-- Keybindings for buffer navigation
		local keymap = vim.api.nvim_set_keymap
		local opts = { noremap = true, silent = true }

		keymap("n", "<Tab>", ":BufferLineCycleNext<CR>", opts) -- Next buffer
		keymap("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts) -- Previous buffer
		vim.keymap.set("n", "<leader>x", function()
			close_buffer(0)
		end, { silent = true, desc = "Close current buffer" })
		keymap("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>", opts) -- Go to buffer 1
		keymap("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>", opts) -- Go to buffer 2
		keymap("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>", opts) -- Go to buffer 3
		keymap("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>", opts) -- Go to buffer 4
		keymap("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>", opts) -- Go to buffer 5

		-- Set red X on the active tab
		vim.cmd([[
      highlight BufferLineCloseButtonSelected guifg=#E67F80 guibg=NONE
      ]])
	end,
}
