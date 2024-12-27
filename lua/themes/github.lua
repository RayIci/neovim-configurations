local map = require("utils").mapkey

-- Used below for transparency toggle
local transparency = false

-- https://github.com/projekt0n/github-nvim-theme
return {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
    config = function()
        -- github_dark
        -- github_dark_default
        -- github_dark_dimmed
        -- github_dark_high_contrast
        -- github_dark_colorblind
        -- github_dark_tritanopia
        -- github_light
        -- github_light_default
        -- github_light_high_contrast
        -- github_light_colorblind
        -- github_light_tritanopia
        local selected_theme = "github_dark_default"

        local github_setup = {
            options = {
                -- Compiled file's destination location
                compile_path = vim.fn.stdpath("cache") .. "/github-theme",
                compile_file_suffix = "_compiled", -- Compiled file suffix
                hide_end_of_buffer = true, -- Hide the '~' character at the end of the buffer for a cleaner look
                hide_nc_statusline = true, -- Override the underline style for non-active statuslines
                transparent = transparency, -- Disable setting bg (make neovim's background transparent)
                terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                dim_inactive = false, -- Non focused panes set to alternative background
                module_default = true, -- Default enable value for modules
                styles = { -- Style to be applied to different syntax groups
                    comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
                    functions = "NONE",
                    keywords = "NONE",
                    variables = "NONE",
                    conditionals = "NONE",
                    constants = "NONE",
                    numbers = "NONE",
                    operators = "NONE",
                    strings = "NONE",
                    types = "NONE",
                },
                inverse = { -- Inverse highlight for different types
                    match_paren = false,
                    visual = false,
                    search = false,
                },
                darken = { -- Darken floating windows and sidebar-like windows
                    floats = true,
                    sidebars = {
                        enable = true,
                        list = {}, -- Apply dark background to specific windows
                    },
                },
                modules = { -- List of various plugins and additional options
                    notify = true,
                    neotest = true,
                    noice = true,
                    mini = true,
                },
            },
            palettes = {},
            specs = {},
            groups = {
                all = {
                    ["@comment"] = { fg = "#6A9955" }, -- Treesitter: Commenti
                    -- ["@string"] = { fg = "#6A9955" },
                    -- ["@string.doc"] = { fg = "#6A9955" }, -- Treesitter: Docstring
                },
            },
        }

        map("n", "<leader>pp", function()
            transparency = not transparency
            local new_setup =
                vim.tbl_extend("force", github_setup.options, { options = { transparent = transparency } })
            require("github-theme").setup(new_setup)
            vim.cmd("colorscheme " .. selected_theme)
        end, { desc = "Theme Transparency Toggle" })

        -- setup must be called before loading
        require("github-theme").setup(github_setup)
        vim.cmd("colorscheme " .. selected_theme)
    end,
}
