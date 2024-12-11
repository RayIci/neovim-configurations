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
        vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope Find Files" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope [F]ile [G]rep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope [F]ile [B]uffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope [F]ile [H]elp Tags" })

        require("telescope").setup({
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-g>"] = "which_key",
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-l>"] = require("telescope.actions").select_default,
                        ["<C-v>"] = require("telescope.actions").select_vertical,
                        ["<C-h>"] = require("telescope.actions").select_horizontal,
                    },
                },
            },
            pickers = {
                find_files = {
                    file_ignore_patterns = { "node_modules", ".git", ".venv" },
                    hidden = true,
                },
            },
            live_grep = {
                file_ingore_patterns = { "node_modules", ".git", ".venv" },
                additional_args = function(_)
                    return { "--hidden" }
                end,
            },
        })
    end,
}
