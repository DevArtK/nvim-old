-- Nvim API aliases --
local opt = vim.opt			-- Can set global, window, buffer settings acts like set:
local g = vim.g				-- Global
local wo = vim.wo			-- Window Options
local bo = vim.bo			-- Buffer Options

local fn = vim.fn					-- Call vim functions
local cmd = vim.cmd					-- Execute vim command
local exec = vim.api.nvim_exec		-- Execute vimscript


cmd('filetype plugin indent on')
g.showcmd = 2				-- Show partial commmand in last line of screen
opt.belloff = 'all'			-- No bells
opt.mouse = 'n'				-- No mouse


local indent = 4
opt.tabstop = indent		-- Number of spaces tabs count
opt.shiftwidth = indent		-- Size of indent
opt.shiftround = true		-- Round to nearest shiftwidth
opt.softtabstop = indent	-- Number of spaces that thab ocunts for while performing editing operation

opt.expandtab = false		-- Use spaces instead of tabs
opt.autoindent = true		-- Auto indent new lines
opt.smarttab = true			-- Tabbing infront of line inserts blanks according to shiftwidth

opt.formatoptions:remove({
    't',					-- Don't auto wrap text
    'o',					-- Don't continue comments with 'o' or 'O'
    '2'						-- ?
})
--opt.formatoptions.append({
    --'r',					-- Continue comments with <Enter>
    --'n',					-- Allow formatting lists
--})

opt.backspace = [[indent,eol,start]]
opt.linebreak = true		-- Wrap long lines, but don't instert EOL, only visual
opt.ruler = true			-- Show line + column number of the cursor positon
wo.colorcolumn = '80'		-- Specifies location of where color column is
opt.cursorline = true		-- Display cursor line location
opt.cursorcolumn = true		-- Display cursor column location
opt.signcolumn = 'yes:1'	-- Sign column on / off
opt.startofline = true		-- Move cursor to start of each line when jumping with certain commands

--opt.lazyredraw = true		-- Faster scrolling
opt.history = 100			-- Remember n lines in history
opt.hlsearch = true			-- Set highlight on search
opt.incsearch = true		-- When tryping a search highlight incrementally where found
opt.inccommand = 'split'	-- Show live substitution results as typed in
opt.ignorecase = true		-- Case insensitive searching
opt.smartcase = true		-- Unless \C or capital used in search

opt.number = true				-- Show current line number
opt.relativenumber = true		-- Show relative line numbers
--opt.nu = true -
--opt.rnu = true
opt.wrap = false				-- Wrap or don't wrap text

opt.updatetime = 50				-- Accelerate refresh time of buffers
--vim.bo.synmaxcol = 400		-- Max column for syntax highlighting

opt.scrolloff = 8				-- Start scrolling when within 8 lines near top/bottom
opt.switchbuf = 'useopen'		-- use already open window if possible
opt.textwidth = 0
opt.ignorecase = true			-- Ignore case
opt.joinspaces = false			-- No double spaces with join
opt.list = false				-- Show some invisible characters

opt.splitbelow = true			-- Put new windows below current
opt.splitright = true			-- Put new windows right of current
opt.hidden = true				-- Enable background buffers

opt.swapfile = false			-- No swapfiles
opt.writebackup = false			-- No tilde files
opt.undofile = true				-- Save history
--opt.clipboard = [[unamed, unnamedplus]] -- MacOs

-- Option settings for diff mode.
opt.diffopt = {
  'filler',						-- Show filler lines.
  'vertical',					-- Start diff mode with vertical splits.
  'hiddenoff',					-- Do not use diff mode for a buffer when it becomes hidden.
  'foldcolumn:0',				-- Set the 'foldcolumn' option to 0.
  'algorithm:histogram',		-- Use the specified diff algorithm.
}

opt.completeopt={ 'menu', 'menuone', 'noselect' }		-- Completion options
opt.pumheight = 10										-- Max number of items to show in popup menu
opt.shortmess = 'c'										-- don't show completion messages
opt.wildmode = { 'list', 'longest' }					-- Command-line completion mode

-- Ignore Files
opt.wildignore = { '*.o', '*~', '*.pyc', '*/.git/*', '*/.hg/*', '*/.svn/*', '*/.DS_store', '**/node_modules' }


--opt.foldlevel = 0				-- Allow folding all the way down
--opt.foldmethod = 'syntax'		-- TEST: 'marker'
--opt.foldlevelstart = 99		-- Start all files with all folds open


-- Don't auto commenting new lines
cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove whitespace on save
cmd[[au BufWritePre * :%s/\s\+$//e]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=1000}
  augroup end
]], false)

-- Disable IndentLine for markdown files (avoid concealing)
cmd[[autocmd FileType markdown let g:indentLine_enabled=0]]

-- THEME --
opt.background = 'dark'
vim.go.termguicolors = true
--opt.termguicolors = true -- Truecolor support
vim.go.t_Co = "256"
vim.go.t_ut = ""
cmd[[syntax on]]

-- vim.g.gruvbox_material_background = 'hard'
-- cmd('colorscheme gruvbox_material' )
vim.g.gruvbox_flat_style = 'hard' -- Darkest mode, darker mode = 'dark'
cmd[[colorscheme gruvbox-flat]]
-- g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

cmd[[au VimEnter * highlight ColorColumn guibg=#282828]]

-- -----------------------------
-- Unused / Not configured pile
-- -----------------------------
-- cmd([[colorscheme gruvbox-flat]])

-- opt.greprg = 'rg --vimgrep --smart-case --no-heading'   -- Search with ripgrep
-- vim.cmd [[ set grepprg=rg\ --vimgrep ]]
-- opt.grepformat = '%f:%l:%c:%m'      -- filename:line number:column number:error message

-- so that vim-closetag works for jsx inside javascript files
-- vim.cmd [[ let g:closetag_filetypes = 'html,xhtml,jsx,javascript,typescript.tsx' ]]

-- Abbreviation example
-- vim.cmd [[iabbrev teh the]]
