local g = vim.g

-- Map leader to space
g.mapleader =  ' '
g.maplocalleader = '\\'

local opts = { noremap = true, silent = true }
-- Test maps
H.map('i', 'jk', '<Esc>')

-- Map ; to :
H.map('n', ';', ':')
H.map('n', 'BS', 'daw') -- Backspace deletes word


H.map('n', '<CR>', ':nohl<CR>')    -- Clear search highlighiting with Space
--map('', '<Space>', '<Nop>')

H.map("n", "n", "nzz")    -- Center jumping to next match
H.map("n", "N", "Nzz")    -- Center jumping to prev match

-- Fix visual indenting
H.map('v', '>', '>gv')
H.map('v', '<', '<gv')

-- Save file with Ctrl + s
H.map("n", "<C-s>", ":w<CR>", { noremap = true, silent = true })
H.map("i", "<C-s>", "<ESC> :w<CR>", { noremap = true, silent = true })

-- Move next / prev buffer
H.map('n', '<leader>n', ':bnext<CR>', opts)
H.map('n', '<leader>p', ':bprev<CR>', opts)
H.map('n', '<leader>q', ':bd<CR>')
H.map("n", "<S-q>", ":bd<CR>", opts)

-- Move line up and down in NORMAL and VISUAL modes
-- Reference: https://vim.fandom.com/wiki/Moving_lines_up_or_down
H.map('v', '<C-J>', ":move '>+1<CR>gv=gv")
H.map('v', '<C-K>', ":move '<-2<CR>gv=gv")
-- H.map('n', '<C-J>', ':move .+1<CR>')
-- H.map('n', '<C-K>', ':move .-2<CR>')

-- Move around splits using Ctrl + {h,j,k,l} --
H.map('n', '<C-h>', '<C-w>h', opts)
H.map('n', '<C-j>', '<C-w>j', opts)
H.map('n', '<C-k>', '<C-w>k', opts)
H.map('n', '<C-l>', '<C-w>l', opts)

H.map('i', '<c-j>', 'pumvisible() ? "<c-n>" : "<c-j>"', { expr = true })

-- Don't yank on delete char
H.map("n", "x", '"_x', { noremap = true, silent = true })
H.map("n", "X", '"_X', { noremap = true, silent = true })
H.map("v", "x", '"_x', { noremap = true, silent = true })
H.map("v", "X", '"_X', { noremap = true, silent = true })H.map('i', '<c-k>', 'pumvisible() ? "<c-p>" : "<c-k>"', { expr = true })

-- Open links under cursor in browser with gx
if vim.fn.has('macunix') == 1 then
  vim.api.nvim_set_keymap("n", "gx", "<cmd>silent execute '!open ' . shellescape('<cWORD>')<CR>", { silent = true })
else
  vim.api.nvim_set_keymap("n", "gx", "<cmd>silent execute '!xdg-open ' . shellescape('<cWORD>')<CR>", { silent = true })
end


-- TODO : Figure out a good mapping for creating splits -- Currently using NvimTree / telescope
-- Copying the vscode behaviour of making tab splits
--H.map('n', '<C-//>', ':vsplit<CR>')
--H.map('n', '<A-//>', ':split<CR>')





---- Move without firing 'BufEnter' autocommands --
--map("n", "<M-j>", ":noautocmd wincmd j<CR>")
--map("n", "<M-h>", ":noautocmd wincmd h<CR>")
--map("n", "<M-k>", ":noautocmd wincmd k<CR>")
--map("n", "<M-l>", ":noautocmd wincmd l<CR>")

---- Term --
--map("t", "<Esc><Esc>", [[<C-\><C-n>]])
--map("t", "<C-j>",      [[<C-\><C-n><C-w>j]])
--map("t", "<C-h>",      [[<C-\><C-n><C-w>h]])
--map("t", "<C-k>",      [[<C-\><C-n><C-w>k]])
--map("t", "<C-l>",      [[<C-\><C-n><C-w>l]])
