local keymaps = function()
    require("which-key").add({
        { "-m",   group = "Markdown" },
        { "-mp",  group = "Markdown Preview" },
        { "-mpt", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle" },
        { "-mpo", "<cmd>MarkdownPreview<cr>",       desc = "Open" },
        { "-mps", "<cmd>MarkdownPreviewStop<cr>",   desc = "Stop" },
        { "-mpc", "<cmd>MarkdownPreviewClose<cr>",  desc = "Close" },
    })
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
