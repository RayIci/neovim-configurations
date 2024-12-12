-- plugin used to generate docstrings

local map = require("utils").mapkey
return {
    "kkoomen/vim-doge",
    build = ":call doge#install()", -- Installa i template dei linguaggi TODO: See if it's ok otherwise need to :call doge#install() from cmdline
    config = function()
        -- Generate comment for current line
        map("n", "<Leader>ddg", "<Plug>(doge-generate)", { desc = "[D]ocstring [D]oge Generate]" })

        vim.g.doge_enable_mappings = 1
        vim.g.doge_comment_type = "auto"
        vim.g.doge_doc_standard_python = "numpy"
    end,
}