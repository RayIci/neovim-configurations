return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("lualine").setup({
            options = {
                icons_enabled = true,
                theme = "auto",
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                },
            },
            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = {
                    "filename",
                    {
                        "tabs",
                        separator = "|",
                        color = { fg = "#ffffff", bg = "#ff0000" },
                        padding = { left = 1, right = 1 },
                        fmt = function()
                            local current_tab = vim.fn.tabpagenr()
                            local tab_list = vim.fn.tabpagebuflist()
                            local tab_names = {}
                            for _, buf in ipairs(tab_list) do
                                local name = vim.fn.bufname(buf)
                                table.insert(tab_names, name)
                            end
                            return "Tab " .. current_tab .. ": " .. table.concat(tab_names, ", ")
                        end,
                    },
                },
                lualine_x = {
                    {
                        require("noice").api.statusline.mode.get,
                        cond = require("noice").api.statusline.mode.has,
                        color = { fg = "#ff9e64" },
                    },
                    function()
                        local venv = os.getenv("VIRTUAL_ENV")
                        return venv and "(" .. vim.fn.fnamemodify(venv, ":t") .. ")" or ""
                    end,
                    "encoding",
                    "fileformat",
                    "filetype",
                },
                lualine_y = { "progress" },
                lualine_z = { "location" },
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { "filename" },
                lualine_x = { "location" },
                lualine_y = {},
                lualine_z = {},
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {},
        })
    end,
}
