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
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        -- Visual mutiline edit
        "mg979/vim-visual-multi",
    },
    {
        -- Comment multiple lines
        "numToStr/Comment.nvim",
        opts = {
            -- add any options here
        },
        config = function()
            require("Comment").setup()
        end,
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
        "rcarriga/nvim-notify",
        config = function()
            vim.opt.termguicolors = true
            vim.notify = require("notify")
            vim.keymap.set(
                "n",
                "<leader>nw",
                ":Telescope notify<CR>",
                { noremap = true, silent = true, desc = "[N]otify [W]indow" }
            )
        end,
    },
    {
        -- LaTex integration
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "mupdf"
        end,
    },
    {
        -- Sorround
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end,
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
    {
        "s1n7ax/nvim-window-picker",
        name = "window-picker",
        event = "VeryLazy",
        version = "2.*",
        config = function()
            require("window-picker").setup()
        end,
    },
    {
        -- Lua Json parser
        "Joakker/lua-json5",
        build = function()
            local uname = vim.loop.os_uname().sysname
            print("Downloading json lua parser for os: ", uname)
            if uname == "Windows_NT" then
                print("Dowloading for Window")
                vim.cmd("!powershell ./install.ps1")
            else
                print("Downloading for linux")
                vim.cmd("!sh ./install.sh")
            end
        end,
    },
}
