local keymaps = function()
    -- Folding
    require("which-key").add({
        { "<leader>ze",  "<cmd>set foldenable!<cr>",       desc = "Toggle Folding" },
        { "<leader>zo",  "zo",                             desc = "Folding Open" },
        { "<leader>zO",  "zc",                             desc = "Folding Close" },
        { "<leader>za",  group = "Folding all" },
        { "<leader>zac", "zM",                             desc = "Folding Close All" },
        { "<leader>zao", "zR",                             desc = "Folding Open All" },
        { "<leader>zx",  "zd",                             desc = "Folding Delete" },
        { "<leader>zn",  "zj",                             desc = "Folding Next" },
        { "<leader>zp",  "zk",                             desc = "Folding Previous" },
        { "<leader>zm",  group = "Folding Method" },
        { "<leader>zme", "<cmd>set foldmethod=expr<cr>",   desc = "Expression" },
        { "<leader>zmi", "<cmd>set foldmethod=indent<cr>", desc = "Indent" },
        { "<leader>zmm", "<cmd>set foldmethod=manual<cr>", desc = "Manual" },
        { "<leader>zms", "<cmd>set foldmethod=syntax<cr>", desc = "Syntax" },
        { "<leader>zmM", "<cmd>set foldmethod=marker<cr>", desc = "Marker" },
        { "<leader>zl",  group = "Folding Level" },
        { "<leader>zlm", "<cmd>set foldlevel=0<cr>",       desc = "Level 0 (Min)" },
        { "<leader>zl1", "<cmd>set foldlevel=1<cr>",       desc = "Level 1" },
        { "<leader>zlM", "<cmd>set foldlevel=99<cr>",      desc = "Level 99 (Max)" },
    })
end

return {
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        config = function()
            -- vim.o.foldcolumn = "auto:9"
            vim.o.foldcolumn = "1" -- '0' is not bad
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true

            -- Option 3: treesitter as a main provider instead
            -- (Note: the `nvim-treesitter` plugin is *not* needed.)
            -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
            -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
            })

            vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
            -- vim.opt.fillchars = {
            --     fold = " ",
            --     foldopen = "▼",
            --     foldclose = "▶",
            --     foldsep = "│",
            --     vert = "│",
            -- }

            keymaps()
        end,
    },
    {
        "luukvbaal/statuscol.nvim",
        opts = function()
            local builtin = require("statuscol.builtin")
            return {
                setopt = true,
                -- override the default list of segments with:
                -- number-less fold indicator, then signs, then line number & separator
                segments = {
                    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
                    { text = { "%s" },             click = "v:lua.ScSa" },
                    {
                        text = { builtin.lnumfunc, " " },
                        condition = { true, builtin.not_empty },
                        click = "v:lua.ScLa",
                    },
                },
            }
        end,
    },
}
