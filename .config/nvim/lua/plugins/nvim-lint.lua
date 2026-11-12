return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = { "ruff", "mypy" },
      yaml = { "yamllint" },
      lua = { "luacheck" },
      c = { "cpplint" },
      cpp = { "cpplint" },
    }

    local group = vim.api.nvim_create_augroup("UserLint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = group,
      callback = function(event)
        if vim.bo[event.buf].buftype ~= "" then
          return
        end
        local buffer_only = event.event == "InsertLeave"
          or vim.bo[event.buf].modified
          or vim.fn.filereadable(vim.api.nvim_buf_get_name(event.buf)) == 0
        lint.try_lint(nil, {
          filter = function(linter)
            return (linter.stdin or not buffer_only) and vim.fn.executable(linter.cmd) == 1
          end,
        })
      end,
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Lint current file" })
  end,
}
