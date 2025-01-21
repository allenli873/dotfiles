local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { import = "v.plugins.autopairs" },
    { import = "v.plugins.barbar" },
    { import = "v.plugins.barbecue" },
    { import = "v.plugins.catppuccin" },
    { import = "v.plugins.cmp" },
    { import = "v.plugins.colorizer" },
    { import = "v.plugins.comment" },
    { import = "v.plugins.conform" },
    { import = "v.plugins.copilot" },
    { import = "v.plugins.crates" },
    { import = "v.plugins.fidget" },
    { import = "v.plugins.flash" },
    { import = "v.plugins.gitsigns" },
    { import = "v.plugins.guess-indent" },
    { import = "v.plugins.heirline" },
    { import = "v.plugins.illuminate" },
    { import = "v.plugins.lint" },
    { import = "v.plugins.lspconfig" },
    { import = "v.plugins.mason" },
    { import = "v.plugins.matchup" },
    { import = "v.plugins.mini-icons" },
    { import = "v.plugins.obsidian" },
    { import = "v.plugins.render-markdown" },
    { import = "v.plugins.signature" },
    { import = "v.plugins.smart-splits" },
    { import = "v.plugins.smear-cursor" },
    { import = "v.plugins.snacks" },
    { import = "v.plugins.statuscol" },
    { import = "v.plugins.surround" },
    { import = "v.plugins.treesitter" },
    { import = "v.plugins.treesj" },
    { import = "v.plugins.typescript-tools" },
    { import = "v.plugins.which_key" },
}, {
    defaults = {
        lazy = true,
        version = false,
    },
    checker = {
        enabled = false,
    },
    change_detection = {
        enabled = false,
        notify = false,
    },

    ui = {
        wrap = true,
        icons = {
            cmd = " ",
            config = "",
            event = "",
            ft = " ",
            init = "",
            import = "",
            keys = "",
            lazy = "  ",
            loaded = "",
            not_loaded = "",
            plugin = " ",
            runtime = "",
            source = " ",
            start = "",
            task = "",
            list = {
                "",
                "",
                "",
                "‒",
            },
        },
    },
    performance = {
        cache = {
            enabled = true,
        },
        rtp = {
            reset = true,
            disabled_plugins = {
                "2html_plugin",
                "fzf",
                "getscript",
                "getscriptPlugin",
                "gzip",
                "logiPat",
                "matchit",
                "matchparen",
                "netrw",
                "netrwFileHandlers",
                "netrwPlugin",
                "netrwSettings",
                "rrhelper",
                "shada",
                "spellfile",
                "tar",
                "tarPlugin",
                "tohtml",
                "tutor",
                "vimball",
                "vimballPlugin",
                "zip",
                "zipPlugin",
            },
        },
    },
})
