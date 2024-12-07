return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
    },
    config = function()
        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- Formatters & linters for mason to install
        require("mason-null-ls").setup({
            ensure_installed = {
                "prettier", -- ts/js formatter
                "stylua", -- lua formatter
                "eslint_d", -- ts/js linter
                "shfmt", -- Shell formatter
                "black", -- Python formatter
                "csharpier", -- C# formatter
                "rustywind", -- tailwind classes organizer
            },

            automatic_installation = true,
        })

        local sources = {
            -- Formatters
            formatting.prettier,
            formatting.stylua,
            formatting.shfmt.with({ args = { "-i", "4" } }),
            formatting.csharpier,
            formatting.rustywind,
            formatting.black,

            -- Diagnostics / Static Analysis (use it as: diagnostics.<diag_name>)
        }

        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            debug = true,
            sources = sources,
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end,
        })
    end,
}
