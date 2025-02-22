return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        animate = { enabled = true },
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            preset = {
                -- stylua: ignore
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                    { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
                    { icon = " ", key = "e", desc = "Create New Obsidian Note", action = ":ObsidianNew" },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 1 },
                { section = "startup" },
            },
        },
        dim = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        lazygit = { enabled = true },
        scroll = { enabled = true },
        indent = { enabled = true },
    },
    -- stylua: ignore
    keys = {
        { "<leader>bd", function() require("snacks").bufdelete() end, desc = "Delete Buffer" },
        { "<leader>bD", function() require("snacks").bufdelete.other() end, desc = "Delete Other Buffers" },
        { "<leader>cR", function() require("snacks").rename.rename_file() end, desc = "Rename File" },
        { "<leader>gb", function() require("snacks").git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>gf", function() require("snacks").lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
        { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Log (cwd)" },
        { "<leader>z", function() require("snacks").zen() end, desc = "Toggle Zen Mode" },
        { "<leader>Z", function() require("snacks").zen.zoom() end, desc = "Toggle Zoom" },
        { "<leader>,", function() require("snacks").picker.buffers() end, desc = "Buffers" },
        { "<leader>/", function() require("snacks").picker.grep() end, desc = "Grep" },
        { "<leader>:", function() require("snacks").picker.command_history() end, desc = "Command History" },
        { "<leader><space>", function() require("snacks").picker.files() end, desc = "Find Files" },
        -- find
        { "<leader>fb", function() require("snacks").picker.buffers() end, desc = "Buffers" },
        { "<leader>fc", function() require("snacks").picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>ff", function() require("snacks").picker.files() end, desc = "Find Files" },
        { "<leader>fg", function() require("snacks").picker.git_files() end, desc = "Find Git Files" },
        { "<leader>fr", function() require("snacks").picker.recent() end, desc = "Recent" },
        -- git
        { "<leader>gc", function() require("snacks").picker.git_log() end, desc = "Git Log" },
        { "<leader>gs", function() require("snacks").picker.git_status() end, desc = "Git Status" },
        -- Grep
        { "<leader>sb", function() require("snacks").picker.lines() end, desc = "Buffer Lines" },
        { "<leader>sB", function() require("snacks").picker.grep_buffers() end, desc = "Grep Open Buffers" },
        { "<leader>sg", function() require("snacks").picker.grep() end, desc = "Grep" },
        { "<leader>sw", function() require("snacks").picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
        -- search
        { '<leader>s"', function() require("snacks").picker.registers() end, desc = "Registers" },
        { "<leader>sa", function() require("snacks").picker.autocmds() end, desc = "Autocmds" },
        { "<leader>sc", function() require("snacks").picker.command_history() end, desc = "Command History" },
        { "<leader>sC", function() require("snacks").picker.commands() end, desc = "Commands" },
        { "<leader>sd", function() require("snacks").picker.diagnostics() end, desc = "Diagnostics" },
        { "<leader>sh", function() require("snacks").picker.help() end, desc = "Help Pages" },
        { "<leader>sH", function() require("snacks").picker.highlights() end, desc = "Highlights" },
        { "<leader>sj", function() require("snacks").picker.jumps() end, desc = "Jumps" },
        { "<leader>sk", function() require("snacks").picker.keymaps() end, desc = "Keymaps" },
        { "<leader>sl", function() require("snacks").picker.loclist() end, desc = "Location List" },
        { "<leader>sM", function() require("snacks").picker.man() end, desc = "Man Pages" },
        { "<leader>sm", function() require("snacks").picker.marks() end, desc = "Marks" },
        { "<leader>sR", function() require("snacks").picker.resume() end, desc = "Resume" },
        { "<leader>sq", function() require("snacks").picker.qflist() end, desc = "Quickfix List" },
        { "<leader>uC", function() require("snacks").picker.colorschemes() end, desc = "Colorschemes" },
        { "<leader>qp", function() require("snacks").picker.projects() end, desc = "Projects" },
        -- LSP
        { "gd", function() require("snacks").picker.lsp_definitions() end, desc = "Goto Definition" },
        { "gr", function() require("snacks").picker.lsp_references() end, nowait = true, desc = "References" },
        { "gI", function() require("snacks").picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() require("snacks").picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        { "<leader>ss", function() require("snacks").picker.lsp_symbols() end, desc = "LSP Symbols" },
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                -- Setup some globals for debugging (lazy-loaded)
                _G.dd = function(...)
                    require("snacks").debug.inspect(...)
                end
                _G.bt = function()
                    require("snacks").debug.backtrace()
                end
                vim.print = _G.dd -- Override print to use snacks for `:=` command

                -- Create some toggle mappings
                require("snacks").toggle.option("spell", { name = "Spelling" }):map("<leader>us")
                require("snacks").toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
                require("snacks").toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
                require("snacks").toggle.diagnostics():map("<leader>ud")
                require("snacks").toggle.line_number():map("<leader>ul")
                require("snacks").toggle
                    .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
                    :map("<leader>uc")
                require("snacks").toggle.inlay_hints():map("<leader>uh")
                require("snacks").toggle.indent():map("<leader>ug")
                require("snacks").toggle.dim():map("<leader>uD")
            end,
        })
    end,
}
