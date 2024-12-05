-- Leader set
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

-- For conciseness
local opts = { noremap = true, silent = true }

-- Move lines up and down
vim.keymap.set("n", "J", ":m .+1<CR>==", vim.tbl_extend("force", opts, { desc = "Move Line Up" }))
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move Line Up" }))
vim.keymap.set("n", "K", ":m .-2<CR>==", vim.tbl_extend("force", opts, { desc = "Move Line Down" }))
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", vim.tbl_extend("force", opts, { desc = "Move Line Down" }))

-- Formatting
vim.keymap.set(
    "n",
    "<leader>f",
    "<cmd>lua vim.lsp.buf.format()<CR>",
    vim.tbl_extend("force", opts, { desc = "[F]ormat Document" })
)

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", vim.tbl_extend("force", opts, { desc = "[S]ave Document" }))

-- save file without auto-formatting
vim.keymap.set(
    "n",
    "<leader>sn",
    "<cmd>noautocmd w <CR>",
    vim.tbl_extend("force", opts, { desc = "[S]ave [N]o Format" })
)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', vim.tbl_extend("force", opts, { desc = "Delete Signle Char (no buff save)" }))

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll Down" }))
vim.keymap.set("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll Up" }))

-- Find and center
vim.keymap.set("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Find Next" }))
vim.keymap.set("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Find Previous" }))

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", vim.tbl_extend("force", opts, { desc = "Resize Horizontal (-)" }))
vim.keymap.set("n", "<Down>", ":resize +2<CR>", vim.tbl_extend("force", opts, { desc = "Resize Horizontal (+)" }))
vim.keymap.set(
    "n",
    "<Left>",
    ":vertical resize -2<CR>",
    vim.tbl_extend("force", opts, { desc = "Resize Vertical (+)" })
)
vim.keymap.set(
    "n",
    "<Right>",
    ":vertical resize +2<CR>",
    vim.tbl_extend("force", opts, { desc = "Resize Vertinal (-)" })
)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", vim.tbl_extend("force", opts, { desc = "Buffer Next" }))
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", vim.tbl_extend("force", opts, { desc = "Buffer Previous" }))
vim.keymap.set("n", "<leader>x", ":Bdelete!<CR>", vim.tbl_extend("force", opts, { desc = "Buffer Delete" })) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", vim.tbl_extend("force", opts, { desc = "Buffer New" }))  -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", vim.tbl_extend("force", opts, { desc = "Split Window [V]ertically" }))  -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", vim.tbl_extend("force", opts, { desc = "Split Window [H]rizontally" })) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Make [S]plit [E]qual Size" })) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", vim.tbl_extend("force", opts, { desc = "Split Close" }))           -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>", vim.tbl_extend("force", opts, { desc = "Split Navigate Up" }))
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>", vim.tbl_extend("force", opts, { desc = "Split Navigate Down" }))
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", vim.tbl_extend("force", opts, { desc = "Split Navigate Left" }))
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", vim.tbl_extend("force", opts, { desc = "Split Navigate Right" }))

-- Tabs
vim.keymap.set("n", "<leader>to", ":tabnew<CR>", vim.tbl_extend("force", opts, { desc = "[T]ab [O]pen New" })) -- open new tab
vim.keymap.set("n", "<leader>tx", ":tabclose<CR>", vim.tbl_extend("force", opts, { desc = "[T]ab Close" }))    -- close current tab
vim.keymap.set("n", "<leader>tn", ":tabn<CR>", vim.tbl_extend("force", opts, { desc = "[T]ab [N]ext" }))       --  go to next tab
vim.keymap.set("n", "<leader>tp", ":tabp<CR>", vim.tbl_extend("force", opts, { desc = "[T]ab [P]revious" }))   --  go to previous tab

-- Toggle line wrapping
vim.keymap.set(
    "n",
    "<leader>tlw",
    "<cmd>set wrap!<CR>",
    vim.tbl_extend("force", opts, { desc = "[T]oggle [L]ine [W]rap" })
)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", vim.tbl_extend("force", opts, { desc = "Indent Left" }))
vim.keymap.set("v", ">", ">gv", vim.tbl_extend("force", opts, { desc = "Indent Right" }))

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', vim.tbl_extend("force", opts, { desc = "Paste" }))

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>dm", vim.diagnostic.open_float, { desc = "Open floating [D]iagnostic [M]essage" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "Open [D]iagnostics [L]ist" })
