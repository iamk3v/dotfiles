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
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set("n", "<leader>ws", vim.lsp.buf.workspace_symbol, opts)
				vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
				vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
				vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
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
