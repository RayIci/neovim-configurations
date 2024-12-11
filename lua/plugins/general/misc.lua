-- Standalone plugins with less than 10 lines of config go here
return {
    {
        -- Colorscheme
        require("themes.catppuccin"),
    },
    {
        -- Tmux & split window navigation
        "christoomey/vim-tmux-navigator",
    },
    {
        -- Detect tabstop and shiftwidth automatically
        "tpope/vim-sleuth",
    },
    {
        -- Powerful Git integration for Vim
        "tpope/vim-fugitive",
    },
    {
        -- GitHub integration for vim-fugitive
        "tpope/vim-rhubarb",
    },
    {
        -- Hints keybinds
        "folke/which-key.nvim",
    },
    {
        -- Autoclose parentheses, brackets, quotes, etc.
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },
    {
        -- Highlight todo, notes, etc in comments
        "folke/todo-comments.nvim",
        event = "VimEnter",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = { signs = false },
    },
    {
        -- High-performance color highlighter
        "norcalli/nvim-colorizer.lua",
        config = true,
    },
    {
        -- Visual mutiline edit
        "mg979/vim-visual-multi",
    },
    {
        -- Comment multiple lines
        "numToStr/Comment.nvim",
        config = true,
    },
    {
        -- Tag autoclose
        "windwp/nvim-ts-autotag",
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,          -- Auto close tags
                    enable_rename = true,         -- Auto rename pairs of tags
                    enable_close_on_slash = true, -- Auto close on trailing </
                },
            })
        end,
    },
    {
        -- Ui for floating input and choosable windows
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        -- Sorround
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = true,
    },
    {
        -- Better file symbol symbols
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup()
            vim.keymap.set(
                "n",
                "<Leader>so",
                "<cmd>SymbolsOutline<CR>",
                { noremap = true, silent = true, desc = "[S]ymbols [O]utline" }
            )
        end,
    },
}
