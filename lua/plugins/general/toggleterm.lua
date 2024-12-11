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
            end,                      -- Default size for horizontal terminals
            open_mapping = [[<C-\>]], -- Default toggle key
            direction = "horizontal", -- Default direction
            close_on_exit = true,     -- Automatically close terminals on process exit
            shell = vim.o.shell,      -- Use the default shell
            shading_factor = 2,
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            persist_size = true,
        })

        function _G.set_terminal_keymaps()
            local opts = { buffer = 0 }
            vim.keymap.set("t", "<C-z>", [[<C-\><C-n>]], opts)
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
        end

        -- if you only want these mappings for toggle term use term://*toggleterm#* instead
        vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

        local Terminal = require("toggleterm.terminal").Terminal

        -- Keymaps for toggling terminals
        vim.keymap.set("n", "<leader>tv", function()
            local vterm = Terminal:new({ direction = "vertical" })
            vterm:toggle()
        end, { noremap = true, silent = true, desc = "[T]erminal [V]ertical" })

        vim.keymap.set("n", "<leader>th", function()
            local hterm = Terminal:new({ direction = "horizontal" })
            hterm:toggle()
        end, { noremap = true, silent = true, desc = "[T]erminal [H]orizontal" })
    end,
}
