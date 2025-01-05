local map = require("utils").mapkey
return {
    "mbbill/undotree",
    config = function()
        map("n", "<leader>u", ":UndotreeToggle<CR>", { desc = "Undotree Toggle" })
    end,
}
