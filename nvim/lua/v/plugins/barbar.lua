return {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.g.barbar_auto_setup = false
    end,
    opts = {
        -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
        -- animation = true,
        -- insert_at_start = true,
        -- …etc.
    },
    -- stylua: ignore
    keys = {
        { "<leader>1", "<Cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
        { "<leader>2", "<Cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
        { "<leader>3", "<Cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
        { "<leader>4", "<Cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
        { "<leader>5", "<Cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },
        { "<leader>6", "<Cmd>BufferGoto 6<CR>", desc = "Go to buffer 6" },
        { "<leader>7", "<Cmd>BufferGoto 7<CR>", desc = "Go to buffer 7" },
        { "<leader>8", "<Cmd>BufferGoto 8<CR>", desc = "Go to buffer 8" },
        { "<leader>9", "<Cmd>BufferGoto 9<CR>", desc = "Go to buffer 9" },
        { "<leader>0", "<Cmd>BufferLast<CR>", desc = "Go to last buffer" },
        { "<leader>p", "<Cmd>BufferPrevious<CR>", desc = "Go to previous buffer" },
        { "<leader>n", "<Cmd>BufferNext<CR>", desc = "Go to next buffer" },
        { "<leader>P", "<Cmd>BufferMovePrevious<CR>", desc = "Move buffer left" },
        { "<leader>N", "<Cmd>BufferMoveNext<CR>", desc = "Move buffer right" },
    },
    lazy = false,
}
