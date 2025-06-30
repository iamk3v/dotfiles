return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim", opts = { automatic_enable = false } },
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
			{ "stevearc/conform.nvim" },
		},
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			-- Setup mason and related tools
			require("mason").setup()

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

			require("mason-lspconfig").setup({
				ensure_installed = servers,
				automatic_installation = true,
			})

			-- Shared on_attach function
			local on_attach = function(client, bufnr)
	      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, remap = false, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, remap = false, desc = "Hover" })
        vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, { buffer = bufnr, remap = false, desc = "Workspace symbol" })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, { buffer = bufnr, remap = false, desc = "Open diagnostics" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr, remap = false, desc = "Code action" })
        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { buffer = bufnr, remap = false, desc = "References" })
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr, remap = false, desc = "Rename" })
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = bufnr, remap = false, desc = "Signature help" })

        -- Autocommand to open diagnostics on cursor hold
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = bufnr,
          callback = function()
            local diagnostics = vim.diagnostic.get(bufnr, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
            if #diagnostics > 0 then
              vim.diagnostic.open_float(nil, {
                scope = "line",
                border = "rounded",
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
              })
            end
          end,
    })

    -- Ensure CursorHold event is triggered (optional, if updatetime is high)
    vim.opt.updatetime = 250 -- Adjust if needed (in milliseconds)
      end

			-- Manually set up each server
			for _, server in ipairs(servers) do
				lspconfig[server].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			require("mason-tool-installer").setup({
				ensure_installed = {
					"luacheck", -- Lua
					"ruff", -- Python
					"mypy", -- Python
					"yamllint", -- YAML
					"cpplint", -- C/C++
					"golangci-lint", -- Go
					"eslint_d", -- JS/TS
					"jsonlint", -- JSON
					"htmlhint", -- HTML
					"stylelint", -- CSS
				},
				automatic_installation = true,
			})

			-- Autoformatting (your own module)
			require("utils.autoformat").setup()
		end,
	},
}
