-- NEOVIM SETTINGS
require("core.keymaps") -- keymaps
require("core.options") -- options

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
require("lazy").setup({
	require("plugins.colortheme"),
	require("plugins.neotree"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
	require("plugins.bufferline"),
	require("plugins.lualine"),
	require("plugins.lsp"),
	require("plugins.cmp-autocompletion"),
	require("plugins.none-ls-autoformatter"),
	require("plugins.alpha"),
	require("plugins.indent-blankline"),
	require("plugins.misc"),
	require("plugins.inc-rename"),
	require("plugins.git-integration"),
})
