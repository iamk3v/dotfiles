return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000,
  opts = {
    term_colors = true,
    transparent_background = true,
    float = {
      transparent = true, -- enable transparent floating windows
    },
    highlight_overrides = {
      all = function()
        return {
          CursorLineNr = { fg = "#FFFFFF", bg = "NONE", bold = true },
          CursorLine = { bg = "NONE" },
          LineNr = { fg = "#DEAFAE", bold = false },
          Visual = { bg = "#515051", fg = "NONE" },
          ColorColumn = { bg = "#515051" },
        }
      end,
    },
    dim_inactive = {
      enabled = false,   -- dims the background color of inactive window
      shade = "dark",
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme "catppuccin"
  end
}
