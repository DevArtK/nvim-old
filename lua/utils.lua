local M = {}

M.cmd = vim.cmd
M.opt = vim.opt
M.fn = vim.fn
M.g = vim.g
M.execute = vim.api.nvim_command
M.lsp = vim.lsp

function M.is_buffer_empty() return vim.fn.empty(vim.fn.expand('%:t')) == 1 end

function M.has_width_gt(cols) return vim.fn.winwidth(0) / 2 > cols end

function M.keymap(mode, new_keymap, command, opts)
    local options = {noremap = true}
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, new_keymap, command, options)
end

function M.dump(o)
    if type(o) == 'table' then
        local s = '{ '
        for k, v in pairs(o) do
            if type(k) ~= 'number' then k = '"' .. k .. '"' end
            s = s .. '[' .. k .. '] = ' .. M.dump(v) .. ','
        end
        return s .. '} '
    else
        return tostring(o)
    end
end
-- Create autogroup
-- Avoids havingto write cmd('augroup' .. group) etc
function M.create_augroup(autocmds, name)
	cmd ('augroup ' .. name)
	cmd('autocmd!')
	for _, autocmd in ipairs(autocmds) do
		cmd('autocmd ' .. table.concat(autocmd, ' '))
	end
	cmd('augroup END')
end

-- Add a apth to the rtp
function M.add_rtp(path)
	local rtp = vim.o.rtp
	rtp = rtp .. ',' .. path
end

-- Map a key with optional options
function M.map(mode, keys, action, options)
	if options == nil then
		options = {}
	end
	vim.api.nvim_set_keymap(mode, keys, action, options)
end

-- Map a key to a lua callback
function M.map_lua(mode, keys, action, options)
	if options == nil then
		options = {}
	end
	vim.api.nvim_set_keymap(mode, keys, "<cmd>lua " .. action .. "<cr>", options)
end

-- Buffer local mappings
function M.map_buf(mode, keys, action, options, buf_nr)
	if options == nil then
		options = {}
	end
	local buf = buf_nr or 0
	vim.api.nvim_buf_set_keymap(buf, mode, keys, action, options)
end

function M.map_lua_buf(mode, keys, action, options, buf_nr)
	if options == nil then
		options = {}
	end
	local buf = buf_nr or 0
	vim.api.nvim_buf_set_keymap(buf, mode, keys, "<cmd>lua " .. action .. "<cr>", options)
end

-- inspect something
-- Taken from https://github.com/jamestthompson3/vimConfig/blob/eeef4a8eeb5a24938f8a0969a35f69c78643fb66/lua/tt/nvim_utils.lua#L106
function M.inspect(item)
  print(vim.inspect(item))
end

return M
