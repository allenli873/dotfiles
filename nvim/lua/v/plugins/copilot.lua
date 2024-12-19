return {
    "github/copilot.vim",
    lazy = false,
    priority = 1,
    disable = false,
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
