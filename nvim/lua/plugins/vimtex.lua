return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- Ensure VimTeX is installed with your plugin manager (example with lazy.nvim, packer, etc.)

		-- VimTeX basic config
		vim.g.vimtex_view_method = "skim"
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_view_skim_sync = 1
		vim.g.vimtex_view_skim_activate = 1

		-- Enable filetype detection, plugin, and indent
		vim.cmd([[
  filetype plugin indent on
  syntax enable
]])

		vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>")
		vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>")
		vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>")
		vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>")
		vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>")
		vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>")
		vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<CR>")
	end,
}
