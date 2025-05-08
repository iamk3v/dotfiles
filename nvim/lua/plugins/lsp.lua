return {
	"VonHeikemen/lsp-zero.nvim",

	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "mason-org/mason.nvim", version = "^1.0.0" }, -- explicit v1 lock
		{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" }, -- same here
		{ "WhoIsSethDaniel/mason-tool-installer.nvim" },
		{ "stevearc/conform.nvim" },
	},

	config = function()
		require("mason").setup()

		local lsp = require("lsp-zero")
		local mason_tool_installer = require("mason-tool-installer")
		local mason_lspconfig = require("mason-lspconfig")
		local lspconfig = require("lspconfig")

		lsp.on_attach(function(client, bufnr)
			local opts = { buffer = bufnr, remap = false }
			vim.keymap.set("n", "gd", function()
				vim.lsp.buf.definition()
			end, opts)
			vim.keymap.set("n", "K", function()
				vim.lsp.buf.hover()
			end, opts)
			vim.keymap.set("n", "<leader>ws", function()
				vim.lsp.buf.workspace_symbol()
			end, opts)
			vim.keymap.set("n", "<leader>vd", function()
				vim.diagnostic.open_float()
			end, opts)
			vim.keymap.set("n", "<leader>ca", function()
				vim.lsp.buf.code_action()
			end, opts)
			vim.keymap.set("n", "<leader>rr", function()
				vim.lsp.buf.references()
			end, opts)
			vim.keymap.set("n", "<leader>rn", function()
				vim.lsp.buf.rename()
			end, opts)
			vim.keymap.set("i", "<C-h>", function()
				vim.lsp.buf.signature_help()
			end, opts)
		end)

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
			"texlab",
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
			},
		})
		-- Setup handlers for all servers
		mason_lspconfig.setup_handlers({
			function(server_name)
				lspconfig[server_name].setup({})
			end,
		})

		-- Autoformatting
		require("utils.autoformat").setup()
	end,
}
