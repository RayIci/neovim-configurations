return {
    {
        -- LaTex integration
        "lervag/vimtex",
        lazy = false,
        init = function()
            vim.g.vimtex_view_method = "mupdf"
        end,
    },
}