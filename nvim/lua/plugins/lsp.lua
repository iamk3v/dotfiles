return {
  "VonHeikemen/lsp-zero.nvim",

  dependencies = {
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    -- Autocompletion
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "L3MON4D3/LuaSnip" },
  },

  config = function()

    require("mason").setup()

    local lsp = require("lsp-zero")
    local mason_tool_installer = require("mason-tool-installer")
    local mason_lspconfig = require("mason-lspconfig")
    local lspconfig = require("lspconfig")
    local cmp = require('cmp')


    lsp.on_attach(function(client, bufnr)
      local opts = {buffer = bufnr, remap = false}
      vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
      vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
      vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
      vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
      vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
      vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
      vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
      vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end)

    local cmp_select = {behavior = cmp.SelectBehavior.Select}

    cmp.setup({
      sources = {
        {name = 'nvim_lsp'},
      },
      snippet = {
        expand = function(args)
          -- You need Neovim v0.10 to use vim.snippet
          vim.snippet.expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['C-p›'] = cmp.mapping.select_prev_item(cmp_select),
        ['C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['C-y>'] = cmp.mapping.confirm({ select = true }),
        ["C-Space>"] = cmp.mapping.complete(),
      }),
    })

    lsp.omnifunc.setup({
      tabcomplete = true,
      use_fallback = true,
      update_on_delete = true,
    })

    -- List of LSP servers
    local lsps = {
      "lua_ls",
      "pyright",
      "yamlls",
      "clangd",
      "gopls",
      "ts_ls",
      "rust_analyzer",
      "jsonls",
      "html",
      "cssls",
    }

    mason_lspconfig.setup({
      ensure_installed = lsps,
      automatic_installation = true,
    })

    mason_tool_installer.setup({
      ensure_installed = {
        "yamllint",
        "mypy",
        "eslint_d",
        "prettier",
      }
    })

    -- Auto-install and configure LSPs
    for _, server_name in ipairs(lsps) do
      mason_lspconfig.setup_handlers({
        function()
          lspconfig[server_name].setup({})
        end
      })
    end

  end
}
