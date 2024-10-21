-- NEOVIM SETTINGS 

-- Formatting settings
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

-- Key mappings
vim.g.mapleader = " "   -- Map leader to space

-- lazy package manager
-- see: https://lazy.folke.io/installation
require("config.lazy")

-- Packages setup
-----------------

-- Catppucin color scheme setup
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Telescope setup 
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<C-p>', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- Treesitter setup
local treesitter_configs = require("nvim-treesitter.configs")
treesitter_configs.setup({
  ensure_installed = { "javascript", "lua", "html", "css", "typescript", "markdown", "markdown_inline" },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },  
})
