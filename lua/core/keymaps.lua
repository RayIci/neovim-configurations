local utils = require("utils")
local map = utils.mapkey

-- Leader set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
map({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

map("n", "J", ":m .+1<CR>==", { desc = "Move Line Up" })
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move Line Up" })
map("n", "K", ":m .-2<CR>==", { desc = "Move Line Down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move Line Down" })

-- Formatting
map("n", "<leader>f", "<cmd>lua vim.lsp.buf.format()<CR>", { desc = "[F]ormat Document" })

-- save file
map("n", "<C-s>", "<cmd> w <CR>", { desc = "[S]ave Document" })

-- save file without auto-formatting
map("n", "<leader>sn", "<cmd>noautocmd w <CR>", { desc = "[S]ave [N]o Format" })

-- delete single character without copying into register
map("n", "x", '"_x', { desc = "Delete Signle Char (no buff save)" })

-- Vertical scroll and center
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll Down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll Up" })

-- Find and center
map("n", "n", "nzzzv", { desc = "Find Next" })
map("n", "N", "Nzzzv", { desc = "Find Previous" })

-- Resize with arrows
map("n", "<Up>", ":resize -2<CR>", { desc = "Resize Horizontal (-)" })
map("n", "<Down>", ":resize +2<CR>", { desc = "Resize Horizontal (+)" })
map("n", "<Left>", ":vertical resize -2<CR>", { desc = "Resize Vertical (+)" })
map("n", "<Right>", ":vertical resize +2<CR>", { desc = "Resize Vertinal (-)" })

-- Buffers
map("n", "<C-Left>", ":BufferLineMovePrev<CR>", { desc = "Buffer Move Previous" })
map("n", "<C-Right>", ":BufferLineMoveNext<CR>", { desc = "Buffer Move Next" })
map("n", "<Tab>", ":bnext<CR>", { desc = "Buffer Next" })
map("n", "<S-Tab>", ":bprevious<CR>", { desc = "Buffer Previous" })
map("n", "<leader>xw", ":Bdelete<CR>", { desc = "Buffer Delete [W]indow" }) -- close buffer
map("n", "<leader>xa", ":bufdo :Bdelete<CR>", { desc = "Buffer Delete [A]ll" }) -- close buffer
map("n", "<leader>b", "<cmd> enew <CR>", { desc = "Buffer New" }) -- new buffer

-- Window management
map("n", "<leader>v", "<C-w>v", { desc = "Split Window [V]ertically" }) -- split window vertically
map("n", "<leader>h", "<C-w>s", { desc = "Split Window [H]rizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make [S]plit [E]qual Size" }) -- make split windows equal width & height
map("n", "<leader>xs", ":close<CR>", { desc = "Split Close" }) -- close current split window

-- Navigate between splits
map("n", "<C-k>", ":wincmd k<CR>", { desc = "Split Navigate Up" })
map("n", "<C-j>", ":wincmd j<CR>", { desc = "Split Navigate Down" })
map("n", "<C-h>", ":wincmd h<CR>", { desc = "Split Navigate Left" })
map("n", "<C-l>", ":wincmd l<CR>", { desc = "Split Navigate Right" })

-- Tabs
map("n", "<leader>to", ":tabnew<CR>", { desc = "[T]ab [O]pen New" }) -- open new tab
map("n", "<leader>xt", ":tabclose<CR>", { desc = "[T]ab Close" }) -- close current tab
map("n", "<leader>tn", ":tabn<CR>", { desc = "[T]ab [N]ext" }) --  go to next tab
map("n", "<leader>tp", ":tabp<CR>", { desc = "[T]ab [P]revious" }) --  go to previous tab
map("n", "<leader>tss", ":tab split<CR>", { desc = "[T]ab [S]plit" }) -- split tab

-- Toggle line wrapping
map("n", "<leader>tlw", "<cmd>set wrap!<CR>", { desc = "[T]oggle [L]ine [W]rap" })

-- Stay in indent mode
map("v", "<", "<gv", { desc = "Indent Left" })
map("v", ">", ">gv", { desc = "Indent Right" })

-- Keep last yanked when pasting
map("v", "p", '"_dP', { desc = "Paste" })

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
map(
    "n",
    "[e",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>",
    { desc = "Prev [E]rror Diagnostic" }
)
map(
    "n",
    "]e",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>",
    { desc = "Next [E]rror Diagnostic" }
)
map(
    "n",
    "[w",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>",
    { desc = "Prev [W]arning Diagnostic" }
)
map(
    "n",
    "]w",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>",
    { desc = "Next [W]arning Diagnostic" }
)
map(
    "n",
    "[i",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.INFO})<CR>",
    { desc = "Prev [I]nfo Diagnostic" }
)
map(
    "n",
    "]i",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.INFO})<CR>",
    { desc = "Next [I]nfo Diagnostic" }
)
map(
    "n",
    "[h",
    "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.HINT})<CR>",
    { desc = "Prev [H]int Diagnostic" }
)
map(
    "n",
    "]h",
    "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.HINT})<CR>",
    { desc = "Next [H]int Diagnostic" }
)
map("n", "<leader>dw", vim.diagnostic.open_float, { desc = "Open floating [D]iagnostic [M]essage" })
map("n", "<leader>dl", utils.toggle_diagnostic_list, { desc = "Open [D]iagnostics [L]ist" })
