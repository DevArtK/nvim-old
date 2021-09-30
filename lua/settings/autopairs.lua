-- local remap = vim.api.nvim_set_keymap
-- local npairs = require('nvim-autopairs')
-- --local ts_conds = require('nvim-autopairs.ts-conds')

-- npairs.setup({
-- 	check_ts = true,
-- 	ts_config = {
-- 		lua = {'string'},-- it will not add a pair on that treesitter node
-- 		javascript = {'template_string'},
-- 		java = false,-- don't check treesitter on java
-- 	}
-- })
-- -- skip it, if you use another global object
-- _G.MUtils= {}

-- vim.g.completion_confirm_key = ""

-- MUtils.completion_confirm=function()
-- 	if vim.fn.pumvisible() ~= 0  then
-- 		if vim.fn.complete_info()["selected"] ~= -1 then
-- 			require'completion'.confirmCompletion()
-- 			return npairs.esc("<c-y>")
-- 		else
-- 			vim.api.nvim_select_popupmenu_item(0 , false , false ,{})
-- 			require'completion'.confirmCompletion()
-- 			return npairs.esc("<c-n><c-y>")
-- 		end
-- 	else
-- 		return npairs.autopairs_cr()
-- 	end
-- end


-- remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', { expr = true , noremap = true })
local npairs = require('nvim-autopairs')

require("nvim-autopairs.completion.cmp").setup({
	map_cr = true, --  map <CR> on insert mode
	map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
	auto_select = false,  -- auto select first item
	map_char = { -- modifies the function or method delimiter by filetypes
		all = '(',
		tex = '{'
	}
})

npairs.setup({
    fast_wrap = {
      map = '<M-e>',
      chars = { '{', '[', '(', '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
      offset = 0, -- Offset from pattern match
      end_key = '$',
      keys = 'qwertyuiopzxcvbnmasdfghjkl',
      check_comma = true,
      hightlight = 'Search'
    },
})
