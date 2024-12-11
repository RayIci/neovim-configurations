local utils = require("utils")

local configure_plugin = function(_, opts)
    require("lsp_signature").setup(opts)

    -- Toggle floating signature window
    utils.mapkey({ "n" }, "<Leader>tsf", function()
        require("lsp_signature").toggle_float_win()
    end, { desc = "[T]oggle [S]ignature [F]loating window" })

    -- Toggle signature help
    utils.mapkey({ "n" }, "<Leader>tsh", function()
        vim.lsp.buf.signature_help()
    end, { desc = "[T]oggle [S]ignature [H]elp" })
end

return {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {
        bind = true,
        handler_opts = {
            border = "rounded",
        },
    },
    config = configure_plugin,
}
