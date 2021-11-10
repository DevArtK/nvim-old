local execute = vim.api.nvim_command
local fn = vim.fn
-- Bootstrap packer if needed
local install_path = fn.stdpath('data') ..
	'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	fn.system({
		'git', 'clone', 'https://github.com/wbthomason/packer.nvim',
		install_path
	})
	execute 'packadd packer.nvim'
end

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]] -- ** Commented out for the self-install method
vim.cmd [[packadd packer.nvim]] -- Load packer
-- autocompile on save
vim.cmd [[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]] -- Re-compile on save


-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
--vim._update_package_paths()
-------------------------------------------------------------------------------------------------

--return require('packer').startup(function(use)
require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- LspConfig
	use({
		'neovim/nvim-lspconfig',
		requires = {
			{ 'folke/lua-dev.nvim' },
			{ 'ray-x/lsp_signature.nvim' },
		},
	})
	-- Plenary
	use 'nvim-lua/plenary.nvim'
	-- Pop-up
	use 'nvim-lua/popup.nvim'

	-- LSP Server Installer
	-- use {
	-- 	'williamboman/nvim-lsp-installer',
	-- }


	-- Treesitter
	use ({'nvim-treesitter/nvim-treesitter',
		requires = {
			{ 'p00f/nvim-ts-rainbow' },
			{ 'romgrk/nvim-treesitter-context' },
			{ 'p00f/nvim-ts-rainbow' },
			{ 'JoosepAlviste/nvim-ts-context-commentstring', after = 'nvim-treesitter' },
			{ 'windwp/nvim-ts-autotag', after = 'nvim-treesitter' }
			-- Swear this after messes with the setup of
			-- { 'nvim-treesitter/nvim-treesitter-textobjects' },
			-- { 'nvim-treesitter/playground', after = 'nvim-treesitter' },
			-- { 'nvim-treesitter/nvim-treesitter-refactor', after = 'nvim-treesitter' },

		}
	})


	use({
		'nvim-telescope/telescope.nvim',
		requires = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-lua/popup.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
		},
	})


	-- Lua Tree
	use 'kyazdani42/nvim-tree.lua'

	-- Toggle Terminal
	use "akinsho/toggleterm.nvim"

	-- Trouble - Diagnositcs List
	use {
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup {
				action_keys = { -- key mappings for actions in the trouble list
					close       = "q", -- close the list
					refresh     = "r", -- manually refresh
					jump        = "<cr>", -- jump to the diagnostic or open / close folds
					toggle_mode = "m", -- toggle between "workspace" and "document" mode
					close_folds = "zM", -- close all folds
					cancel      = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
					open_folds  = "zR", -- open all folds
					previous    = "k", -- preview item
					next        = "j" -- next item
				},
				indent_lines = true, -- add an indent guide below the fold icons
				auto_open    =  false, -- automatically open the list when you have diagnostics
				auto_close   =  true, -- automatically close the list when you have no diagnostics
				signs = {
					-- icons / text used for a diagnostic
					error = "",
					warning = "",
					hint = "",
					information = "",
					other = "﫠"
				}
			}
		end
}

	-- Peek Lines -- Settings in settings/nvim_tree
	use 'nacro90/numb.nvim'

	-- Web-Dev Icons
	use 'kyazdani42/nvim-web-devicons'


	-- Colorizer
	use {
		'norcalli/nvim-colorizer.lua',
		run = function()
			require('plugins/colorizer').setup()
		end
	}


	use({
		'hrsh7th/nvim-cmp',
		requires = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
		}
	})

	use {
		'David-Kunz/cmp-npm',
		requires = {
			'nvim-lua/plenary.nvim'
		}
	}

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use {'SirVer/ultisnips', requires = {"honza/vim-snippets", "quangnguyen30192/cmp-nvim-ultisnips"}, config = "require('settings.ultisnips')", after = 'nvim-cmp'}


	-- Comments
	use {'b3nj5m1n/kommentary'}


	-- Indent Blank Line Scope Guides
	use {
		'lukas-reineke/indent-blankline.nvim',
		config = function ()
			vim.cmd [[highlight IndentBlanklineIndent guifg=#3c425d]]
			require'indent_blankline'.setup({
				show_trailing_blankline_indent = false,
				use_treesitter                 = true,
				show_first_indent_level        = false,
				buftype_exclude                = {'terminal'},
				filetype                       = {'yaml', 'vue', 'html', 'json', 'lua', 'javascript', 'java'},
				show_current_context           = true,
				char_highlight_list            = {'IndentBlanklineIndent'}
			})
		end,
	}
	-- Auto open / close tags
	use 'windwp/nvim-autopairs'


	-- Git Info
	use {
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function()
			require('gitsigns').setup({
				current_line_blame = false,
				current_line_blame_opts = {
					delay = 1000,
					virt_text = true,
					virt_text_pos = 'right_align',
				},
				update_debounce = 200,
				numhl = true
			})
		end
	}
	-- Gruvbox-flat
	use 'eddyekofo94/gruvbox-flat.nvim'
	use 'sainnhe/gruvbox-material'
	use 'karb94/neoscroll.nvim'

	use {
		'nvim-lualine/lualine.nvim',
		requires = {'kyazdani42/nvim-web-devicons', opt = true}
	}

	use {
		'noib3/cokeline.nvim',
		requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
	}


	use 'kristijanhusak/orgmode.nvim'


	-- Which key helps with finding keymaps
	use "folke/which-key.nvim"


	-- use {
	-- 	'AckslD/nvim-whichkey-setup.lua',
	-- 	requires = {'liuchengxu/vim-which-key'},
	-- }


	-- DAP Specific
	use 'mfussenegger/nvim-dap'
	use 'mfussenegger/nvim-jdtls'
	use 'nvim-telescope/telescope-dap.nvim'
	use 'rcarriga/nvim-dap-ui'

	use 'onsails/lspkind-nvim'
	use 'tjdevries/colorbuddy.nvim'

	use 'simrat39/rust-tools.nvim'

	use "tversteeg/registers.nvim"

	use 'sindrets/diffview.nvim'
	use 'mbbill/undotree'

	use 'mattn/emmet-vim'
end)
