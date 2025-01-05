return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter_configs = require("nvim-treesitter.configs")
        treesitter_configs.setup({
            ensure_installed = {
                "c_sharp",
                "cpp",
                "c",
                "make",
                "cmake",
                "javascript",
                "typescript",
                "tsx",
                "html",
                "css",
                "python",
                "yaml",
                "sql",
                "bash",
                "markdown",
                "markdown_inline",
                "lua",
                "latex",
                "csv",
                "dockerfile",
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
