-- Sorround text plugin
return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      -- Configuration here, or leave empty to use defaults
    })
  end,
}

-- KEYS:
--
-- surr*ound_words            ysiw)           (surround_words)
-- make strings               ys$"            "make strings"
-- delete ar*ound me!]        ds]             delete around me!
-- emove <b>HTML t*ags</b>    dst             remove HTML tags
-- change quot*es'            cs'"            "change quotes"
-- b>or tag* types</b>        csth1<CR>       <h1>or tag types</h1>
-- elete(functi*on calls)     dsf             function calls
