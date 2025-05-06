return {
	"VonHeikemen/lsp-zero.nvim",

	dependencies = {
		{ "neovim/nvim-lspconfig" },
		{ "williamboman/mason.nvim" },
		{ "williamboman/mason-lspconfig.nvim" },
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

		--   lsp.omnifunc.setup({
		--     tabcomplete = true,
		--     use_fallback = true,
		--     update_on_delete = true,
		--   })

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

		-- Auto-install and configure LSPs
		for _, server_name in ipairs(lsps) do
			mason_lspconfig.setup_handlers({
				function()
					lspconfig[server_name].setup({})
				end,
			})
		end

		-- Autoformatting
		require("utils.autoformat").setup()
	end,
}
