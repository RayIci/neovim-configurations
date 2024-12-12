local map = require("utils").mapkey

return {
    {
        -- Virtual environment selector
        "linux-cultist/venv-selector.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "mfussenegger/nvim-dap",
            "mfussenegger/nvim-dap-python", --optional
            { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
        },
        config = function()
            require("venv-selector").setup({
                auto_refresh = true,
                search = true,
            })

            map("n", "-pvs", "<cmd>VenvSelect<cr>", { desc = "Python: [V]env [S]elect" })
            map("n", "-pvc", "<cmd>VenvSelectCached<cr>", { desc = "Python: [V]env Select [C]ached" })
        end,
        branch = "regexp",
        event = "VeryLazy",
    },
}
