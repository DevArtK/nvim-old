require'nvim-tree'.setup {
	-- hijack netrw window on startup
  hijack_netrw        = true,
  -- open the tree when running this setup function
  open_on_setup       = true,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd          = false,
	view = {
    -- width of the window, can be either a number (columns) or a string in `%`
		width = 30,
    -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = 'left',
    -- if true the tree will resize itself after opening a file
		auto_resize = false,
		mappings = {
      -- custom only false will merge the list with the default mappings
      -- if true, it will only use your list to set the mappings
			custom_only = false,
      -- list of mappings to set on the tree manually
		list = {}
		}
	}
}
H.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }


H.g.nvim_tree_icons = {
	default = "‣ ",
    symlink = '',
    git = {
        unstaged = '~',
        staged = '+',
        unmerged = '!',
        renamed = '≈',
        untracked = '?',
        deleted = '-',
    },
}

H.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
}

H.g.nvim_tree_indent_markers = 1

-- H.g.nvim_tree_icons = {
-- 	default = "‣ "
-- }
