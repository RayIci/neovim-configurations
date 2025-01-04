return {
    "rcarriga/nvim-notify",
    config = function()
        require("notify").setup({
            stages = "fade_in_slide_out",
            timeout = 200,
            top_down = false,
            render = "default",
            -- max_width = 50,
            -- max_height = 10,
        })
        vim.opt.termguicolors = true
        vim.notify = require("notify")
        vim.keymap.set(
            "n",
            "<leader>nw",
            ":Telescope notify<CR>",
            { noremap = true, silent = true, desc = "Notify Window" }
        )
    end,
}
