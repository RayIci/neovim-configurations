local ensure_installed = {
    "prettier",  -- ts/js formatter
    "stylua",    -- lua formatter
    "eslint_d",  -- ts/js linter
    "shfmt",     -- Shell formatter
    "black",     -- Python formatter
    "csharpier", -- C# formatter
    "rustywind", -- tailwind classes organizer
}

local diagnostics_config = function(diagnostics)
    return {}
end

local formatting_config = function(formatting)
    return {
        formatting.prettier,
        formatting.stylua,
        formatting.shfmt.with({ args = { "-i", "4" } }),
        formatting.csharpier,
        formatting.rustywind,
        formatting.black,
    }
end

return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "jayp0521/mason-null-ls.nvim",
    },
    config = function()
        vim.diagnostic.config({
            virtual_text = false,    -- Disable virtual text (error shown in the editor)
            signs = true,            -- Show error, warning, etc... signs
            underline = true,        -- Show the line under an error, warning, etc ...
            update_in_insert = true, -- Update the errors, warnings also on insert
            severity_sort = true,
            float = {
                source = "always",
                border = "rounded",
            },
        })

        vim.cmd.highlight("DiagnosticUnderlineError guisp=#ff0000 gui=undercurl")
        vim.cmd.highlight("DiagnosticUnderlineWarn guisp=#FFA500 gui=undercurl")
        vim.cmd.highlight("DiagnosticUnderlineInfo guisp=#00FFFF gui=undercurl")
        vim.cmd.highlight("DiagnosticUnderlineHint guisp=#00FF00 gui=undercurl")

        vim.api.nvim_create_autocmd("ColorScheme", {
            pattern = "*",
            callback = function()
                vim.cmd("highlight DiagnosticError guisp=#FF0000 gui=undercurl")
                vim.cmd("highlight DiagnosticWarn guisp=#FFA500 gui=undercurl")
                vim.cmd("highlight DiagnosticInfo guisp=#00FFFF gui=undercurl")
                vim.cmd("highlight DiagnosticHint guisp=#00FF00 gui=undercurl")
            end,
        })

        local null_ls = require("null-ls")
        local formatting = null_ls.builtins.formatting   -- to setup formatters
        local diagnostics = null_ls.builtins.diagnostics -- to setup linters

        -- Formatters & linters for mason to install
        require("mason-null-ls").setup({
            ensure_installed = ensure_installed,
            automatic_installation = true,
        })

        local sources = vim.tbl_deep_extend("force", diagnostics_config(diagnostics), formatting_config(formatting))

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
