return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    config = function()
        -- Keymap that for transparency toggle
        vim.keymap.set("n", "<leader>tt", function()
            local cat = require("catppuccin")
            cat.options.transparent_background = not cat.options.transparent_background
            cat.compile()
            vim.cmd.colorscheme(vim.g.colors_name)
        end, { desc = "[T]heme Transparency [T]oggle" })

        require("catppuccin").setup({
            flavour = "frappe", -- latte, frappe, macchiato, mocha
            transparent_background = true, -- disables setting the background color.
            show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
            term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
            dim_inactive = {
                enabled = false, -- dims the background color of inactive window
                shade = "dark",
                percentage = 0.15, -- percentage of the shade to apply to the inactive window
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            no_underline = false, -- Force no underline
            styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
                comments = { "italic" }, -- Change the style of comments
                conditionals = { "italic" },
            },
            color_overrides = {},
            custom_highlights = function(colors)
                return {
                    DiagnosticError = { sp = colors.red, style = { "undercurl" } },
                    DiagnosticWarn = { sp = colors.yellow, style = { "undercurl" } },
                    DiagnosticInfo = { sp = colors.blue, style = { "undercurl" } },
                    DiagnosticHint = { sp = colors.teal, style = { "undercurl" } },
                }
            end,
            default_integrations = true,
            integrations = {
                cmp = true,
                gitsigns = true,
                neotree = true,
                nvimtree = true,
                treesitter = true,
                notify = true,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
                dap = {
                    enabled = true,
                    enable_ui = true,
                },
                neotest = {
                    enabled = true,
                    styles = {
                        passed = "bold",
                        failed = "italic",
                    },
                },
            },
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
