return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    local group = vim.api.nvim_create_augroup("UserTreesitter", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      callback = function(event)
        local parser = vim.treesitter.get_parser(event.buf)
        if not parser then
          return
        end

        local language = parser:lang()
        if vim.treesitter.query.get(language, "highlights") then
          vim.treesitter.start(event.buf, language)
        end
        if vim.treesitter.query.get(language, "indents") then
          vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
