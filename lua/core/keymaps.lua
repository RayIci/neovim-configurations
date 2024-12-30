local utils = require("utils")
local map = utils.mapkey

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "J", ":m .+1<CR>==", { desc = "Move Line Up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })
map("n", "K", ":m .-2<CR>==", { desc = "Move Line Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })

-- Formatting
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "Format Document" })

-- save file
map("n", "<C-s>", "<cmd> w <CR>", { desc = "Save Document" })

-- save file without auto-formatting
map("n", "<leader>sn", "<cmd>noautocmd w <CR>", { desc = "Save No Format" })

-- delete single character without copying into register
map("n", "x", '"_x', { desc = "Delete Signle Char (no buff save)" })

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

-- Find and center
map("n", "n", "nzzzv", { desc = "Find Next" })
map("n", "N", "Nzzzv", { desc = "Find Previous" })

-- Resize with arrows
map("n", "<Up>", [[<cmd>horizontal resize +5<cr>]], { desc = "Resize Horizontal (-)" })
map("n", "<Down>", [[<cmd>horizontal resize -5<cr>]], { desc = "Resize Horizontal (+)" })
map("n", "<Left>", [[<cmd>vertical resize +2<cr>]], { desc = "Resize Vertical (+)" })
map("n", "<Right>", [[<cmd>vertical resize -2<cr>]], { desc = "Resize Vertinal (-)" })

-- Buffers
map("n", "<C-Left>", ":BufferLineMovePrev<CR>", { desc = "Buffer Move Previous" })
map("n", "<C-Right>", ":BufferLineMoveNext<CR>", { desc = "Buffer Move Next" })
map("n", "<Tab>", ":bnext<CR>", { desc = "Buffer Next" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Buffer Previous" })
map("n", "<leader>xw", ":Bdelete<CR>", { desc = "Buffer Delete Window" })        -- close buffer
map("n", "<leader>xf", ":Bdelete!<CR>", { desc = "Buffer Delete Window Force" }) -- close buffer force
map("n", "<leader>xa", ":bufdo :Bdelete<CR>", { desc = "Buffer Delete All" })    -- close buffer
map("n", "<leader>b", "<cmd> enew <CR>", { desc = "Buffer New" })                -- new buffer

-- Window management
map("n", "<leader>v", "<C-w>v", { desc = "Split Window Vertically" })  -- split window vertically
map("n", "<leader>h", "<C-w>s", { desc = "Split Window Hrizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make Split Equal Size" })   -- make split windows equal width & height
map("n", "<leader>xs", ":close<CR>", { desc = "Split Close" })         -- close current split window

-- Navigate between splits
map("n", "<C-k>", ":wincmd k<CR>", { desc = "Split Navigate Up" })
map("n", "<C-j>", ":wincmd j<CR>", { desc = "Split Navigate Down" })
map("n", "<C-h>", ":wincmd h<CR>", { desc = "Split Navigate Left" })
map("n", "<C-l>", ":wincmd l<CR>", { desc = "Split Navigate Right" })

-- Tabs
require("which-key").add({
    { "<leader>tn",       "<cmd>tabnew<cr>",    desc = "Tab New" },
    { "<leader>t<Tab>",   "<cmd>tabn<cr>",      desc = "Tab Next" },
    { "<leader>t<S-Tab>", "<cmd>tabp<cr>",      desc = "Tab Previous" },
    { "<leader>ts",       "<cmd>tab split<cr>", desc = "Tab Split" },
    { "xt",               "<cmd>tabclose<cr>",  desc = "Tab Close" },
})

-- Toggle line wrapping
map("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle Line Wrap" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- Keep last yanked when pasting
map("v", "p", '"_dP', { desc = "Paste" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous Diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next Diagnostic message" })
map(
    "n",
    "[e",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
    { desc = "Prev Error Diagnostic" }
)
map(
    "n",
    "]e",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
    { desc = "Next Error Diagnostic" }
)
map(
    "n",
    "[w",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>",
    { desc = "Prev Warning Diagnostic" }
)
map(
    "n",
    "]w",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>",
    { desc = "Next Warning Diagnostic" }
)
map(
    "n",
    "[i",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.INFO})<CR>",
    { desc = "Prev Info Diagnostic" }
)
map(
    "n",
    "]i",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.INFO})<CR>",
    { desc = "Next Info Diagnostic" }
)
map(
    "n",
    "[h",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.HINT})<CR>",
    { desc = "Prev Hint Diagnostic" }
)
map(
    "n",
    "]h",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.HINT})<CR>",
    { desc = "Next Hint Diagnostic" }
)
map("n", "<leader>dw", vim.diagnostic.open_float, { desc = "Open floating Diagnostic Message" })
map("n", "<leader>dl", utils.toggle_diagnostic_list, { desc = "Open Diagnostics List" })
