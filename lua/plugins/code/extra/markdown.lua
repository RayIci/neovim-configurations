local map = require("utils").mapkey

local keymaps = function()
    map("n", "-mp", "<cmd>MarkdownPreviewToggle<cr>", { desc = "[M]arkdown [P]review Toggle" })
end

return {

    -- Preview markdown
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && yarn install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
            keymaps()
        end,
        ft = { "markdown" },
    },
}
