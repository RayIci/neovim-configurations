return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local treesitter_configs = require("nvim-treesitter.configs")
        treesitter_configs.setup({
            ensure_installed = { "javascript", "lua", "html", "css", "typescript", "markdown", "markdown_inline" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
