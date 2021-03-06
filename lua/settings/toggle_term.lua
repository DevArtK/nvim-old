
require("toggleterm").setup{
	-- size can be a number or function which is passed the current terminal
	-- size = 20 |
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-t>]],
	-- hide the number column in toggleterm buffers
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	-- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	shading_factor = '2',
	start_in_insert = true,
	-- whether or not the open mapping applies in insert mode
	insert_mappings = true,
	persist_size = true,
	--  'vertical' | 'horizontal' | 'window' | 'float',
	direction = 'horizontal',
	-- close the terminal window when the process exits
	close_on_exit = false,
	-- change the default shell
	shell = vim.o.shell,
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		border = 'single',
		width = 50,
		height = 50,
		winblend = 3,
		highlights = {
			border = "Normal",
			background = "Normal",
		}
	}
}
