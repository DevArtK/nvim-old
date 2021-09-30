H = require('utils')
G = {}

require('plugins')						-- Packer plugin installs
require('settings/lspconf')				-- nvim_lsp.setup()'s
require('main_keymappings')				-- Plugin specific keymaps
require('main_settings')				-- Base vim/nvim settings 'set xxx'

require('settings/treesitter')			-- Treesitter setup
require('settings/diagnostics_lsp')		-- Lsp diagnostics setup
require('settings/nvim_tree')			-- File explorer setup
require('settings/cokeline')			-- Bufferline setup
require('settings/lualine')				-- Statusline setup
require('settings/telescope')			-- Telescope setup
require('settings/neoscroll')			-- Smooth scroll setup
require('settings/cmp')					-- Completetion setup
require('settings/autopairs')			-- Auto pairs setup
require('settings/colorizer')			-- Hex color visualizer setup
--require('settings/treesitter_context') -- Function / Class context under buffer line (doesn't need to be here ?)



require('keymappings/nvim_tree')		-- Keybindings for NvimTree
require('keymappings/telescope')		-- Keybindings for telescope
require('keymappings/kommentary')		-- Keybindings for Kommentary



-- vim.lsp.set_log_level("debug")

--Attempt to run the language server, and open the log with:
-- :lua vim.cmd('e'..vim.lsp.get_log_path()

