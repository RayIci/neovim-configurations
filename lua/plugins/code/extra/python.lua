local keymaps = function()
    require("which-key").add({
        { "-p",   group = "Python" },
        { "-pv",  group = "Virtual Environment" },
        { "-pvc", "<cmd>VenvSelectCached<cr>",  desc = "Cached" },
        { "-pvs", "<cmd>VenvSelect<cr>",        desc = "Select" },
    })
end

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

            keymaps()
        end,
        branch = "regexp",
        event = "VeryLazy",
    },
}
