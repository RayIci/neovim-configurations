-- Codeium copilot
--      to set it up check the following link: https://github.com/Exafunction/codeium.vim

local map = require("utils").mapkey

local keymaps = function()
    map("i", "<C-g>", function()
        return vim.fn["codeium#Accept"]()
    end, { expr = true })
    map("i", "<c-;>", function()
        return vim.fn["codeium#CycleCompletions"](1)
    end, { expr = true })
    map("i", "<c-,>", function()
        return vim.fn["codeium#CycleCompletions"](-1)
    end, { expr = true })
    map("i", "<c-x>", function()
        return vim.fn["codeium#Clear"]()
    end, { expr = true })
end

return {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
        keymaps()
    end,
}
