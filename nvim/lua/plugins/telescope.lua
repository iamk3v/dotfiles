return {
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim" },
		event = "BufRead",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>fd", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
			vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, { desc = "Recent Files" })
			vim.keymap.set("n", "<space>fh", require("telescope.builtin").help_tags, { desc = "Help Tags" })

			require("telescope").load_extension("ui-select")
			require("telescope.multigrep").setup()
		end,
	},
}
