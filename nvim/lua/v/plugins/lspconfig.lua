return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
        "williamboman/mason.nvim",
        "b0o/schemastore.nvim",
        "saghen/blink.cmp",
    },
    config = function()
        vim.fn.sign_define(
            "DiagnosticSignError",
            { text = "", texthl = "DiagnosticSignError", numhl = "DiagnosticSignError" }
        )
        vim.fn.sign_define(
            "DiagnosticSignHint",
            { text = "", texthl = "DiagnosticSignHint", numhl = "DiagnosticSignHint" }
        )
        vim.fn.sign_define(
            "DiagnosticSignInfo",
            { text = "", texthl = "DiagnosticSignInfo", numhl = "DiagnosticSignInfo" }
        )
        vim.fn.sign_define(
            "DiagnosticSignWarn",
            { text = "", texthl = "DiagnosticSignWarn", numhl = "DiagnosticSignWarn" }
        )

        vim.diagnostic.config({
            virtual_text = {
                source = false,
                prefix = "",
                format = function(diagnostic)
                    local sign = ""

                    if diagnostic.severity == vim.diagnostic.severity.ERROR then
                        sign = vim.fn.sign_getdefined("DiagnosticSignError")[1].text
                    elseif diagnostic.severity == vim.diagnostic.severity.WARN then
                        sign = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text
                    elseif diagnostic.severity == vim.diagnostic.severity.INFO then
                        sign = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text
                    elseif diagnostic.severity == vim.diagnostic.severity.HINT then
                        sign = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text
                    end

                    return string.format("%s%s: %s ", sign, diagnostic.source or "", diagnostic.message)
                end,
            },
            float = {
                source = false,
                border = "single",
                header = false,
                format = function(diagnostic)
                    return string.format("%s: %s ", diagnostic.source or "", diagnostic.message)
                end,
            },
            signs = true,
            underline = true,
            update_in_insert = false,
            severity_sort = true,
        })

        vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
            border = "single",
        })

        vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
            border = "single",
        })

        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Next Diagnostic" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { buffer = ev.buf, desc = "Signature Help" })
                vim.keymap.set(
                    "n",
                    "<leader>D",
                    vim.lsp.buf.type_definition,
                    { buffer = ev.buf, desc = "Show Type Definition" }
                )
                vim.keymap.set("n", "<leader>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Actions" })
                vim.keymap.set("v", "<leader>lc", vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code Actions" })
                vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename" })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "Show hover" })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "Goto Declaration" })
                vim.keymap.set("n", "<leader>li", function()
                    vim.lsp.inlay_hint(0, nil)
                end, { buffer = ev.buf, desc = "Toggle Inlay Hints" })
            end,
        })

        -- Global capabilities from blink.cmp
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        vim.lsp.config("bashls", {
            cmd_env = {
                GLOB_PATTERN = "*@(.sh|.inc|.bash|.command|.zsh)",
            },
            filetypes = { "sh", "zsh" },
        })

        vim.lsp.config("basedpyright", {})

        vim.lsp.config("cssls", {})

        vim.lsp.config("docker_compose_language_service", {})

        vim.lsp.config("dockerls", {})

        vim.lsp.config("emmet_language_server", {})

        vim.lsp.config("eslint", {
            root_markers = {
                ".eslintrc",
                ".eslintrc.js",
                ".eslintrc.yml",
                ".eslintrc.json",
                "eslint.config.js",
                ".eslintrc.cjs",
                ".eslintrc.yaml",
            },
        })

        vim.lsp.config("gh_actions_ls", {
            filetypes = { "yaml.github" },
        })

        vim.filetype.add({
            pattern = {
                [".*/%.github[%w/]+workflows[%w/]+.*%.ya?ml"] = "yaml.github",
            },
        })

        vim.lsp.config("golangci_lint_ls", {})

        vim.lsp.config("gopls", {
            settings = {
                gopls = {
                    experimentalPostfixCompletions = true,
                    analyses = {
                        unusedparams = true,
                        shadow = true,
                    },
                    staticcheck = true,
                },
            },
            init_options = {
                usePlaceholders = true,
            },
        })

        vim.lsp.config("graphql", {})

        vim.lsp.config("html", {
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
        })

        vim.lsp.config("jsonls", {
            on_attach = function(client)
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false
            end,
            settings = {
                json = {
                    schemas = require("schemastore").json.schemas(),
                    validate = { enable = true },
                },
            },
            init_options = {
                provideFormatter = false,
            },
        })

        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    runtime = { version = "LuaJIT" },
                    diagnostics = { globals = { "vim" } },
                    format = { enable = false },
                    completion = { callSnippet = "Replace" },
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
        })

        vim.lsp.config("taplo", {})

        vim.lsp.config("yamlls", {
            settings = {
                yaml = {
                    schemaStore = {
                        enable = false,
                        url = "",
                    },
                    schemas = require("schemastore").yaml.schemas(),
                },
            },
        })

        vim.lsp.config("tailwindcss", {
            root_markers = {
                "tailwind.config.js",
                "tailwind.config.cjs",
                "tailwind.config.mjs",
                "tailwind.config.ts",
                "postcss.config.js",
                "postcss.config.cjs",
                "postcss.config.mjs",
                "postcss.config.ts",
            },
        })

        vim.lsp.enable({
            "bashls",
            "basedpyright",
            "cssls",
            "docker_compose_language_service",
            "dockerls",
            "emmet_language_server",
            "eslint",
            "gh_actions_ls",
            "golangci_lint_ls",
            "gopls",
            "graphql",
            "html",
            "jsonls",
            "lua_ls",
            "taplo",
            "yamlls",
            "tailwindcss",
        })
    end,
}
