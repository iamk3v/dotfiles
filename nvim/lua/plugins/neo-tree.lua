return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  lazy = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { mode = "n",
      "<C-n>",
      "<cmd>Neotree filesystem reveal left<CR>",
      desc = "Reveal filesystem left",
    },
    {
      mode = "n",
      "<C-b>",
      "<cmd>Neotree toggle<CR>",
      desc = "Toggle filesystem left",
    },
  },
}
