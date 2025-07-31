local logo = [[                                                                      
                                                                      
        ████ ██████           █████      ██                     
       ███████████             █████                             
       █████████ ███████████████████ ███   ███████████   
      █████████  ███    █████████████ █████ ██████████████   
     █████████ ██████████ █████████ █████ █████ ████ █████   
   ███████████ ███    ███ █████████ █████ █████ ████ █████  
  ██████  █████████████████████ ████ █████ █████ ████ ██████ 

  ]]
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    explorer = {
      enabled = true,           -- Enable the built-in explorer
      auto_close = true,        -- Close explorer after opening a file (optional)
      focus = "input",          -- Focus the input box on open (optional)
      jump = { close = false }, -- Control whether explorer closes after jumping (optional)
    },
    dashboard = {
      enabled = true,
      preset = {
        header = logo,
      },
      sections = {
        { section = "header" },
        { section = "keys",   gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
    notifier = {
      enabled = true,
      timeout = 3000,
    },
    terminal = { enabled = true },
    picker = { enabled = true },
    input = { enabled = true },
    indent = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    styles = {
      notification = {
        wo = { wrap = true }, -- Wrap notifications
      },
    },
  },
  keys = {
    -- Picker
    -- Top Pickers & Explorer
    { "<leader><space>", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
    { "<leader>,",       function() Snacks.picker.buffers() end,                                 desc = "Buffers" },
    { "<leader>/",       function() Snacks.picker.grep() end,                                    desc = "Grep" },
    { "<leader>:",       function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>n",       function() Snacks.picker.notifications() end,                           desc = "Notification History" },
    -- find
    { "<leader>fc",      function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
    { "<leader>ff",      function() Snacks.picker.files() end,                                   desc = "Find Files" },
    { "<leader>fg",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
    { "<leader>fp",      function() Snacks.picker.projects() end,                                desc = "Projects" },
    { "<leader>fr",      function() Snacks.picker.recent() end,                                  desc = "Recent" },
    -- git
    { "<leader>gl",      function() Snacks.picker.git_log() end,                                 desc = "Git Log" },
    { "<leader>gL",      function() Snacks.picker.git_log_line() end,                            desc = "Git Log Line" },
    { "<leader>gs",      function() Snacks.picker.git_status() end,                              desc = "Git Status" },
    { "<leader>gS",      function() Snacks.picker.git_stash() end,                               desc = "Git Stash" },
    { "<leader>gd",      function() Snacks.picker.git_diff() end,                                desc = "Git Diff (Hunks)" },
    { "<leader>gf",      function() Snacks.picker.git_log_file() end,                            desc = "Git Log File" },
    -- Grep
    { "<leader>sb",      function() Snacks.picker.grep_buffers() end,                            desc = "Grep Open Buffers" },
    { "<leader>sw",      function() Snacks.picker.grep_word() end,                               desc = "Visual selection or word", mode = { "n", "x" } },
    -- Search
    { '<leader>s"',      function() Snacks.picker.registers() end,                               desc = "Registers" },
    { '<leader>s/',      function() Snacks.picker.search_history() end,                          desc = "Search History" },
    { "<leader>sa",      function() Snacks.picker.autocmds() end,                                desc = "Autocmds" },
    { "<leader>sl",      function() Snacks.picker.lines() end,                                   desc = "Buffer Lines" },
    { "<leader>sc",      function() Snacks.picker.command_history() end,                         desc = "Command History" },
    { "<leader>sC",      function() Snacks.picker.commands() end,                                desc = "Commands" },
    { "<leader>sd",      function() Snacks.picker.diagnostics() end,                             desc = "Diagnostics" },
    { "<leader>sD",      function() Snacks.picker.diagnostics_buffer() end,                      desc = "Buffer Diagnostics" },
    { "<leader>sH",      function() Snacks.picker.help() end,                                    desc = "Help Pages" },
    { "<leader>si",      function() Snacks.picker.icons() end,                                   desc = "Icons" },
    { "<leader>sj",      function() Snacks.picker.jumps() end,                                   desc = "Jumps" },
    { "<leader>sk",      function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
    { "<leader>sL",      function() Snacks.picker.loclist() end,                                 desc = "Location List" },
    { "<leader>sm",      function() Snacks.picker.marks() end,                                   desc = "Marks" },
    { "<leader>sM",      function() Snacks.picker.man() end,                                     desc = "Man Pages" },
    { "<leader>sp",      function() Snacks.picker.lazy() end,                                    desc = "Search for Plugin Spec" },
    { "<leader>sq",      function() Snacks.picker.qflist() end,                                  desc = "Quickfix List" },
    { "<leader>sR",      function() Snacks.picker.resume() end,                                  desc = "Resume" },
    { "<leader>su",      function() Snacks.picker.undo() end,                                    desc = "Undo History" },
    { "<leader>uC",      function() Snacks.picker.colorschemes() end,                            desc = "Colorschemes" },
    -- LSP
    { "gd",              function() Snacks.picker.lsp_definitions() end,                         desc = "Goto Definition" },
    { "gD",              function() Snacks.picker.lsp_declarations() end,                        desc = "Goto Declaration" },
    { "gR",              function() Snacks.picker.lsp_references() end,                          nowait = true,                     desc = "References" },
    { "gI",              function() Snacks.picker.lsp_implementations() end,                     desc = "Goto Implementation" },
    { "gy",              function() Snacks.picker.lsp_type_definitions() end,                    desc = "Goto T[y]pe Definition" },
    { "<leader>ss",      function() Snacks.picker.lsp_symbols() end,                             desc = "LSP Symbols" },
    { "<leader>sS",      function() Snacks.picker.lsp_workspace_symbols() end,                   desc = "LSP Workspace Symbols" },
    -- Explorer
    { "<leader>e",       function() Snacks.explorer() end,                                       desc = "Open Snacks Explorer", },
    -- Notifier
    { "<leader>un",      function() Snacks.notifier.hide() end,                                  desc = "Dismiss All Notifications" },
    { "<leader>bd",      function() Snacks.bufdelete() end,                                      desc = "Delete Buffer" },
    { "<leader>gb",      function() Snacks.git.blame_line() end,                                 desc = "Git Blame Line" },
    { "<leader>gB",      function() Snacks.gitbrowse() end,                                      desc = "Git Browse" },
    { "<leader>cr",      function() Snacks.rename.rename_file() end,                             desc = "Rename File" },
    -- Terminal
    { "<leader>_",       function() Snacks.terminal() end,                                       desc = "Toggle Terminal" },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
            .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
            :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.inlay_hints():map("<leader>uh")

        vim.api.nvim_set_hl(0, "SnacksDashboardHeader", { fg = "#61afef", bold = true }) -- Blue header
        vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#e5c07b" })                 -- Yellow keys
        vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#98c379" })                -- Green icons
        vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#61afef" })              -- Purple footer
        vim.api.nvim_set_hl(0, "SnacksDashboardSpecial", { fg = "#98c379" })             -- Green special elements
        vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#abb2bf" })                -- Light gray descriptions
      end,
    })
  end,
}
