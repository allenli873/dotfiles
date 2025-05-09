return {
    "olimorris/codecompanion.nvim",
    lazy = false,
    opts = {},
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "echasnovski/mini.diff",
            config = function()
                local diff = require("mini.diff")
                diff.setup({
                    source = diff.gen_source.none(),
                })
            end,
        },
    },
    cmd = {
        "CodeCompanion",
        "CodeCompanionActions",
        "CodeCompanionChat",
        "CodeCompanionCmd",
    },
    keys = {
        { "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "AI Toggle [C]hat" },
        { "<leader>an", "<cmd>CodeCompanionChat<cr>", mode = { "n", "v" }, desc = "AI [N]ew Chat" },
        { "<leader>aa", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "AI [A]ction" },
        { "ga", "<cmd>CodeCompanionChat Add<CR>", mode = { "v" }, desc = "AI [A]dd to Chat" },
        -- prompts
        { "<leader>ae", "<cmd>CodeCompanion /explain<cr>", mode = { "v" }, desc = "AI [E]xplain" },
    },
    opts = {
        display = {
            action_palette = {
                prompt = "Prompt ", -- Prompt used for interactive LLM calls
                provider = "snacks",
                opts = {
                    show_default_actions = true, -- Show the default actions in the action palette?
                    show_default_prompt_library = true, -- Show the default prompt library in the action palette?
                },
            },
            chat = {
                intro_message = "  What can I help with? (Press ? for options)",
                show_references = true,
                show_header_separator = false,
                show_settings = false,
                window = {
                    width = 0.4,
                    opts = {
                        relativenumber = false,
                    },
                },
            },
            diff = {
                provider = "mini_diff",
            },
        },
        adapters = {
            openai = function()
                return require("codecompanion.adapters").extend("openai", {
                    env = {
                        api_key = os.getenv("OPENAI_API_KEY"),
                    },
                })
            end,
            aio_openai = function()
                return require("plugins.codecompanion.aio-openai-adapter").make()
            end,
        },
    },
}
