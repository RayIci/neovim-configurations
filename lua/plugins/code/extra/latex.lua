local keymaps = function()
    require("which-key").add({
        { "-l",   group = "LaTex" },
        { "-lv",  group = "View" },
        { "-lvc", "<cmd>VimtexCompile<cr>", desc = "Compile" },
        { "-lvv", "<cmd>VimtexView<cr>",    desc = "View" },
        { "-lvs", "<cmd>VimtexStop<cr>",    desc = "Stop" },
        { "-lvk", "<cmd>VimtexKill<cr>",    desc = "Kill" },
    })
end

return {
    {
        -- LaTex integration
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "mupdf"

            keymaps()
        end,
    },
}
