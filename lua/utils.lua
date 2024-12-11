local utils = {}

function utils.mapkey(mode, key, functionalty, opts)
    vim.keymap.set(mode, key, functionalty, vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts))
end

return utils
