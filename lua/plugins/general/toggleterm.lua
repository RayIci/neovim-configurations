local map = require("utils").mapkey

return {
    "akinsho/toggleterm.nvim",
    config = function()
        require("toggleterm").setup({
            size = function(term)
                if term.direction == "horizontal" then
                    return 20
                elseif term.direction == "vertical" then
                    return vim.o.columns * 0.4
                end
            end,
            open_mapping = [[<c-\>]],
            shade_filetypes = {},
            shade_terminals = true,
            shading_factor = 1,
            start_in_insert = true,
            persist_size = true,
            direction = "horizontal",
            insert_mappings = true,
            shell = vim.o.shell,
        })

        map("n", "<c-\\>", [[<Cmd>ToggleTerm<CR>]], { desc = "Toggle Terminal", silent = true, noremap = true })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            map("t", "<C-z>", [[<C-\><C-n>]], opts)
            map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        -- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        -- Keymaps for toggling terminals
        local Terminal = require("toggleterm.terminal").Terminal
        map("n", "<leader>tv", function()
            local vterm = Terminal:new({ direction = "vertical" })
            vterm:toggle()
        end, { desc = "[T]erminal [V]ertical" })

        map("n", "<leader>th", function()
            local hterm = Terminal:new({ direction = "horizontal" })
            hterm:toggle()
        end, { desc = "[T]erminal [H]orizontal" })
    end,
}
