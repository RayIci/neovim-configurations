local keymaps = function()
    require("which-key").add({
        { "<leader>g",  group = "Git" },
        { "<leader>gd", "<cmd>DiffviewOpen<cr>",          desc = "Diffview" },
        { "<leader>gD", "<cmd>DiffviewClose<cr>",         desc = "Diffview Close" },
        { "<leader>gf", "<cmd>DiffviewFileHistory<cr>",   desc = "Diffview File History" },
        { "<leader>gF", "<cmd>DiffviewFileHistory %<cr>", desc = "Diffview File History Current File" },
        { "<leader>gr", "<cmd>DiffviewRefresh<cr>",       desc = "Diffview Refresh" },
        { "<leader>gt", "<cmd>DiffviewToggleFiles<cr>",   desc = "Diffview Toggle Files" },
        { "<leader>gT", "<cmd>DiffviewToggleFiles %<cr>", desc = "Diffview Toggle Files Current File" },
    })
end

-- See: https://github.com/sindrets/diffview.nvim
return {
    "sindrets/diffview.nvim",
    config = function()
        keymaps()
    end,
}
