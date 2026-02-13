return {
  "lervag/vimtex",
  lazy = true, -- Enable lazy loading
  ft = "tex",  -- Load VimTeX only for LaTeX files
  init = function()
    -- VimTeX basic config
    vim.g.vimtex_view_method = "skim"
    vim.g.vimtex_compiler_method = "latexmk"
    vim.g.vimtex_view_skim_sync = 1
    vim.g.vimtex_view_skim_activate = 1

    vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>")
    vim.keymap.set("n", "<leader>lk", "<cmd>VimtexStop<CR>")
    vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>")
    vim.keymap.set("n", "<leader>lv", "<cmd>VimtexView<CR>")
    vim.keymap.set("n", "<leader>le", "<cmd>VimtexErrors<CR>")
    vim.keymap.set("n", "<leader>lt", "<cmd>VimtexTocToggle<CR>")
    vim.keymap.set("n", "<leader>li", "<cmd>VimtexInfo<CR>")
  end,
}
