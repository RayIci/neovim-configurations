local utils = {}

-- GENERAL UTILS
utils.dopts = {
    noremap = true,
    silent = true,
}

function utils.mapkey(mode, key, functionalty, opts)
    opts = opts or {}
    mode = mode or "n"
    vim.keymap.set(mode, key, functionalty, vim.tbl_deep_extend("force", utils.dopts, opts))
end

-- DIAGNOSTIC UTILS
function utils.toggle_diagnostic_list()
    local is_open = false
    for _, win in pairs(vim.fn.getwininfo()) do
        if win.loclist == 1 then
            is_open = true
        end
    end
    if is_open then
        vim.cmd("lclose")
    else
        vim.diagnostic.setloclist()
    end
end

return utils
