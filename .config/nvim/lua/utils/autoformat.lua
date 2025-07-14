local setup = function()
	local conform = require("conform")
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			yaml = { "prettier" },
			go = { "gofmt" },
			javascript = { "biome" },
			typescript = { "biome" },
			json = { "biome" },
			html = { "biome" },
			css = { "biome" },
			c = { "clang-format" },
			cpp = { "clang-format" },
			latex = { "latexindent" },
		},
		formatters = {
			["clang-format"] = {
				args = {
					"--style={BasedOnStyle: Google, IndentAccessModifiers: true, AccessModifierOffset: 2}",
				},
			},
		},
	})

	--[[
  -- Autocommand that formats the files on save
  -- If formatter is not available, conform fallbacks to lsp
  --]]
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = vim.api.nvim_create_augroup("custom-conform", { clear = true }),
		callback = function(args)
			-- Skip formatting if the toggle is set
			if vim.g.disable_autoformat then
				return
			end

			require("conform").format({
				bufnr = args.buf,
				lsp_fallback = true,
				quiet = true,
			})
		end,
	})
end

setup()

return { setup = setup }
