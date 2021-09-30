require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"bash",
		"tsx",
		"typescript",
		"javascript",
		"dockerfile",
		"toml",
		"fish",
		"php",
		"json",
		"jsdoc",
		"yaml",
		"java",
		"python",
		"rust",
		"lua",
		"html",
		"scss"
	},
	--ignore_install = { "javascript" }, -- List of parsers to ignore installing

	highlight = {
		enable = true,              -- false will disable the whole extension
		--disable = { "c", "rust" },  -- list of language that will be disabled
		-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
		-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
		-- Using this option may slow down your editor, and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = false,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},

	indent = {
		enable = true
	},

	autopairs = {
		enable = true
	},
	rainbow = {
		enable = true,
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name string
	}


}

