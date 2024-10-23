-- Plugin that allows renames across multiple files

return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  config = function()
    require("inc_rename").setup({})

    -- keymap for renaming
    vim.keymap.set("n", "<leader>rn", ":IncRename ")
  end,
}
