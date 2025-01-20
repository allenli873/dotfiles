return {
    "mrjones2014/smart-splits.nvim",
    -- stylua: ignore
    keys = {
        { "<C-h>", function() require("smart-splits").move_cursor_left() end, desc = "Navigator Left" },
        { "<C-l>", function() require("smart-splits").move_cursor_right() end, desc = "Navigator Right" },
        { "<C-k>", function() require("smart-splits").move_cursor_up() end, desc = "Navigator Up" },
        { "<C-j>", function() require("smart-splits").move_cursor_down() end, desc = "Navigator Down" },
        { "<M-h>", function() require("smart-splits").resize_left() end, desc = "Resize Left" },
        { "<M-l>", function() require("smart-splits").resize_right() end, desc = "Resize Right" },
        { "<M-k>", function() require("smart-splits").resize_up() end, desc = "Resize Up" },
        { "<M-j>", function() require("smart-splits").resize_down() end, desc = "Resize Down" },
    },
    config = true,
    lazy = false,
}
