return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        animate = { enabled = true },
        bigfile = { enabled = true },
        dashboard = { enabled = true },
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
        { "<leader>cR", function() require("snacks").rename.rename_file() end, desc = "Rename File" },
        { "<leader>gb", function() require("snacks").git.blame_line() end, desc = "Git Blame Line" },
        { "<leader>gf", function() require("snacks").lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit" },
        { "<leader>gl", function() require("snacks").lazygit.log() end, desc = "Lazygit Log (cwd)" },
        { "<leader>z", function() require("snacks").zen() end, desc = "Toggle Zen Mode" },
        { "<leader>Z", function() require("snacks").zen.zoom() end, desc = "Toggle Zoom" },
    },
}
