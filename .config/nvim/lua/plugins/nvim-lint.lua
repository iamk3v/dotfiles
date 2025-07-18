return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			python = { "ruff", "mypy" },
			yaml = { "yamllint" },
			lua = { "luacheck" },
			--  go = { "golangcilint" },
			c = { "cpplint" },
			cpp = { "cpplint" },
			--	javascript = { "biome" },
			--	typescript = { "biome" },
			--	javascriptreact = { "biome" },
			--	typescriptreact = { "biome" },
			--	json = { "biome" },
			--	html = { "biome" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>l", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
