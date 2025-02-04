return {
    "echasnovski/mini.nvim",
    lazy = true,
    init = function()
        require("mini.cursorword").setup()
        require("mini.files").setup({
            mappings = {
                go_in = "<Right>",
                go_out = "<Left>",
            },
        })
        require("mini.hipatterns").setup()
        require("mini.notify").setup()
        require("mini.splitjoin").setup({
            mappings = {
                toggle = "J",
            },
        })
        require("mini.surround").setup()
        require("mini.pairs").setup()
    end,
    -- stylua: ignore
    keys = {
        { "<C-n>", function() require("mini.files").open() end, desc = "Open Files" },
    },
}
