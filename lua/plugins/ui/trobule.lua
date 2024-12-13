-- Trouble is a plugin that makes it easy to see and navigate diagnostics, references, and other errors in a buffer.
-- https://github.com/folke/trouble.nvim

return {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
        {
            "<leader>dk",
            "<cmd>Trouble diagnostics toggle<cr>",
            desc = "[D]iagnostic Window (Trouble)",
        },
        {
            "<leader>dkb",
            "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "[D]iagnostic Window [B]uffer  (Trouble)",
        },
        {
            "<leader>sl",
            "<cmd>Trouble symbols toggle focus=false<cr>",
            desc = "[S]ymbols [L]ist (Trouble)",
        },
        {
            "<leader>lw",
            "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
            desc = "[L]LSP [W]indow, Definitions/references/... (Trouble)",
        },
        {
            "<leader>ll",
            "<cmd>Trouble loclist toggle<cr>",
            desc = "[L]ocation [L]ist (Trouble)",
        },
        {
            "<leader>ql",
            "<cmd>Trouble qflist toggle<cr>",
            desc = "[Q]uickfix [L]ist (Trouble)",
        },
    },
}
