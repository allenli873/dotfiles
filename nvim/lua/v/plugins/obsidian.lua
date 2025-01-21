return {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = false,
    -- ft = "markdown",
    -- event = {
    --     -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --     -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    --     -- refer to `:h file-pattern` for more examples
    --     "BufReadPre ~/Documents/obsidian_vault/*.md",
    --     "BufNewFile ~/Documents/obsidian_vault/*.md",
    -- },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/personal",
            },
        },
        -- key mappings, below are the defaults
        mappings = {
            -- overrides the 'gf' mapping to work on markdown/wiki links within your vault
            ["gf"] = {
                action = function()
                    return require("obsidian").util.gf_passthrough()
                end,
                opts = { noremap = false, expr = true, buffer = true },
            },
            -- toggle check-boxes
            ["<leader>ti"] = {
                action = function()
                    return require("obsidian").util.toggle_checkbox()
                end,
                opts = { buffer = true },
            },
        },
        completion = {
            nvim_cmp = true,
            min_chars = 2,
        },
        ---@param title string|?
        ---@return string
        note_id_func = function(title)
            -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
            -- In this case a note with the title 'My new note' will be given an ID that looks
            -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
            local suffix = ""
            if title ~= nil then
                -- If title is given, transform it into valid file name.
                suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
            else
                -- If title is nil, just add 4 random uppercase letters to the suffix.
                for _ = 1, 4 do
                    suffix = suffix .. string.char(math.random(65, 90))
                end
            end
            local date = os.date("%Y-%m-%d")
            return date .. "-" .. suffix
        end,
    },
    ui = { enable = false },
}
