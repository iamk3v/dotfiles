return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim",        opts = { automatic_enable = false } },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Mason setup
      require("mason").setup()
      local mason_lsp = require("mason-lspconfig")

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

      mason_lsp.setup({
        ensure_installed = servers,
        automatic_installation = true,
      })

      -- Common on_attach for all servers
      local on_attach = function(client, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, remap = false, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "K", vim.lsp.buf.hover, "Hover documentation")
        map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbol")
        map("n", "<leader>vd", vim.diagnostic.open_float, "Show diagnostics")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>rr", vim.lsp.buf.references, "Find references")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("i", "<C-h>", vim.lsp.buf.signature_help, "Signature help")

        -- Diagnostics on hover (non-intrusive)
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            local diags = vim.diagnostic.get(bufnr, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
            if #diags > 0 then
              vim.diagnostic.open_float(nil, {
                scope = "line",
                border = "rounded",
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              })
            end
          end,
        })

        vim.opt.updatetime = 25
      end

      -- Configure each LSP server natively
      for _, server in ipairs(servers) do
        vim.lsp.config[server] = {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = (server == "lua_ls") and {
            Lua = {
              workspace = {
                library = {
                  [vim.env.VIMRUNTIME] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          } or nil,
        }

        -- Explicitly enable the server
        vim.lsp.enable(server)
      end

      -- Format on save (unless disabled)
      vim.api.nvim_create_autocmd("BufWritePre", {
        callback = function()
          if not vim.g.disable_autoformat then
            vim.lsp.buf.format({ async = false })
          end
        end,
      })
    end,
  },
}
