-- Leader set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Lazy package manager setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        error("Error cloning lazy.nvim:\n" .. out)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Lazy plugin setup
-- .setup("plugins") is found because the plugins are in the ./lua/plugins folder
require("lazy").setup("plugins")

-- NEOVIM SETTINGS
--    done after plugin loadings because keymaps require a plugin
require("core.keymaps") -- keymaps
require("core.options") -- options
