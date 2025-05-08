return {
	{
		"supermaven-inc/supermaven-nvim",
		lazy = true,
		config = function()
			require("supermaven-nvim").setup({})
		end,
	},
}
