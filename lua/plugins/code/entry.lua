return {

    -- General important code plugins
    require("plugins.code.lsp"),
    require("plugins.code.cmp-autocompletion"),
    require("plugins.code.none-ls"),
    require("plugins.code.debugger"),
    require("plugins.code.unit-test"),
    require("plugins.code.treesitter"),
    require("plugins.code.extra.markdown"),
    -- require("plugins.code.lsp-signature"),

    -- Extra code plugins
    require("plugins.code.extra.python"),
    require("plugins.code.extra.latex"),
}
