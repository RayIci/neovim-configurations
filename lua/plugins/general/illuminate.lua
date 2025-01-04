local map = require("utils").mapkey

return {
    "RRethy/vim-illuminate",
    config = function()
        require("illuminate").configure({
            providers = {
                "lsp", -- Usa i provider LSP
                "treesitter", -- Usa Treesitter
                "regex", -- Usa espressioni regolari per il matching
            },
            delay = 120, -- Ritardo in millisecondi per l'illuminazione
            filetypes_denylist = { "NvimTree", "packer", "lazy" }, -- Filetype da escludere
            under_cursor = true, -- Evidenzia anche la parola sotto il cursore
        })

        -- Configura il keymapping per navigare tra i riferimenti
        map("n", "<C-g>", require("illuminate").goto_next_reference, { desc = "Prossima referenza" })
        map("n", "<C-p>", require("illuminate").goto_prev_reference, { desc = "Referenza precedente" })
    end,
}
