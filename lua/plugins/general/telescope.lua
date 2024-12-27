local map = require("utils").mapkey

local keymaps = function(builtin)
    map("n", "<leader><leader>", builtin.find_files, { desc = "Telescope Find Files" })
    map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope [F]ile [G]rep" })
    map("n", "<leader>fb", builtin.buffers, { desc = "Telescope [F]ile [B]uffers" })
    map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope [F]ile [H]elp Tags" })
end

return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function(_, opts)
        opts.transparent = true
        opts.italic_comments = true
        opts.borderless_telescope = false
    end,
    config = function()
        local builtin = require("telescope.builtin")
        local actions = require("telescope.actions")

        -- Trouble plugin integration
        local open_with_trouble = require("trouble.sources.telescope").open
        local add_to_trouble = require("trouble.sources.telescope")
        .add                                                            -- Use this to add more results without clearing the trouble list

        keymaps(builtin)

        require("telescope").setup({
            defaults = {
                mappings = {
                    i = {
                        ["<C-g>"] = "which_key",
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-l>"] = require("telescope.actions").select_default,
                        ["<C-v>"] = require("telescope.actions").select_vertical,
                        ["<C-h>"] = require("telescope.actions").select_horizontal,
                        ["<C-t>"] = open_with_trouble,
                    },
                    n = { ["<C-t>"] = open_with_trouble },
                },
            },
            pickers = {
                find_files = {
                    file_ignore_patterns = { "node_modules", "^.git", ".venv", "__pycache__", "*cahce*" },
                    hidden = true,
                },
            },
            live_grep = {
                file_ingore_patterns = { "node_modules", "^.git", ".venv", "__pycache__", "*cahce*" },
                additional_args = function(_)
                    return { "--hidden" }
                end,
            },
        })
    end,
}
