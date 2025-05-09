return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    priority = 1,
    disable = false,
    config = function()
        require("copilot").setup({
            panel = {
                auto_refresh = true,
            },
            suggestion = {
                auto_trigger = true,
            },
        })
    end,
    keys = {
        {
            "<C-J>",
            'copilot#Accept("\\<CR>")',
            mode = "i",
            expr = true,
            desc = "[COPILOT] Accept",
            replace_keycodes = false,
        },
    },
}
