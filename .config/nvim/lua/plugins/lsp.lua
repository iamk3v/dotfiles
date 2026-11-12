local servers = {
  "lua_ls",
  "pyright",
  "yamlls",
  "clangd",
  "gopls",
  "ts_ls",
  "jsonls",
  "html",
  "cssls",
  "texlab",
}

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "mason-org/mason.nvim",
    "mason-org/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = servers,
      automatic_enable = false,
    })

    vim.lsp.config("*", {
      capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          workspace = {
            library = {
              [vim.env.VIMRUNTIME] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
          diagnostics = { globals = { "vim" } },
        },
      },
    })
    vim.lsp.config("html", {
      -- The embedded CSS validator requires a non-null lint settings object.
      settings = { css = { lint = { validProperties = {} } } },
    })

    local group = vim.api.nvim_create_augroup("UserLsp", { clear = true })
    local mappings = {
      { "n", "gd", vim.lsp.buf.definition, "Go to definition" },
      { "n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbol" },
      { "n", "<leader>vd", vim.diagnostic.open_float, "Show diagnostics" },
      { "n", "<leader>ca", vim.lsp.buf.code_action, "Code action" },
      { "n", "<leader>rr", vim.lsp.buf.references, "Find references" },
      { "n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol" },
      { "i", "<C-h>", vim.lsp.buf.signature_help, "Signature help" },
    }

    vim.api.nvim_create_autocmd("LspAttach", {
      group = group,
      callback = function(event)
        for _, map in ipairs(mappings) do
          vim.keymap.set(map[1], map[2], map[3], { buffer = event.buf, desc = map[4] })
        end
      end,
    })
    vim.api.nvim_create_autocmd("CursorHold", {
      group = group,
      callback = function(event)
        local line = vim.api.nvim_win_get_cursor(0)[1] - 1
        if #vim.diagnostic.get(event.buf, { lnum = line }) > 0 then
          vim.diagnostic.open_float({ bufnr = event.buf, scope = "line", focusable = false })
        end
      end,
    })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      callback = function(event)
        if vim.g.disable_autoformat then
          return
        end
        local formatters = vim.lsp.get_clients({
          bufnr = event.buf,
          method = "textDocument/formatting",
        })
        if #formatters > 0 then
          vim.lsp.buf.format({ bufnr = event.buf })
        end
      end,
    })

    vim.lsp.enable(servers)
  end,
}
