return {
    -- Lua Json parser
    "Joakker/lua-json5",
    build = function()
        local uname = vim.loop.os_uname().sysname
        print("Downloading json lua parser for os: ", uname)
        if uname == "Windows_NT" then
            print("Dowloading for Window")
            vim.cmd("!powershell ./install.ps1")
        else
            print("Downloading for linux")
            vim.cmd("!sh ./install.sh")
        end
    end,
}
