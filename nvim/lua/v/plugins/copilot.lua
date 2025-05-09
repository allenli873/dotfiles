return {
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        event = "InsertEnter",
        disable = false,
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = false,
                },
            })
        end,
    },
    {
        "giuxtaposition/blink-cmp-copilot",
    },
}
