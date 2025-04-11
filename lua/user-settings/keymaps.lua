local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Set <Space> as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Normal mode
map("n", "<leader>w", ":w<CR>", opts)                   -- Save file
map("n", "<leader>q", ":q<CR>", opts)                   -- Quit file
map("n", "<leader>wq", ":wq<CR>", opts)                 -- Save and quit
map("n", "<leader>rel", "[[:%s/\r//ge<CR>]]", opts)     -- Save and quit

-- Insert mode
map("i", "jk", "<Esc>", opts)                          -- Exit insert mode using 'jk'
map("i", "<C-s>", "<Esc>:w<CR>a", opts)                -- Save file without leaving insert mode

-- Visual block mode
map("x", "J", ":move '>+1<CR>gv-gv", opts)             -- Move selection down
map("x", "K", ":move '<-2<CR>gv-gv", opts)             -- Move selection up

-- Navigation
map("n", "<C-d>", "<C-d>zz", opts)                     -- Page down and center cursor
map("n", "<C-u>", "<C-u>zz", opts)                     -- Page up and center cursor

-- File navigation
map("n", "gg", "gg0", opts)                            -- Go to start of file (line 1, column 0)
map("n", "G", "G$", opts)                              -- Go to end of file (last line, end of line)

map("n", "\\", ":Neotree toggle<CR>", opts)                  -- Open file browser
