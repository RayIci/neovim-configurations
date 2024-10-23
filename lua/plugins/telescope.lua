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
        vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
        vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

        require("telescope").setup({
            defaults = {
                -- Default configuration for telescope goes here:
                -- config_key = value,
                mappings = {
                    i = {
                        -- map actions.which_key to <C-h> (default: <C-/>)
                        -- actions.which_key shows the mappings for your picker,
                        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
                        ["<C-h>"] = "which_key",
                        ["<C-k>"] = require("telescope.actions").move_selection_previous,
                        ["<C-j>"] = require("telescope.actions").move_selection_next,
                        ["<C-l>"] = require("telescope.actions").select_default,
                        ["<C-leader>v"] = require("telescope.actions").select_vertical,
                        ["<C-leader>h"] = require("telescope.actions").select_horizontal,
                    },
                },
            },
            pickers = {
                -- Default configuration for builtin pickers goes here:
                -- picker_name = {
                --   picker_config_key = value,
                --   ...
                -- }
                -- Now the picker_config_key will be applied every time you call this
                -- builtin picker
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
            extensions = {
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
            },
        })
    end,
}
