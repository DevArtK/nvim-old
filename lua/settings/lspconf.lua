local nvim_lsp = require('lspconfig')


local on_attach = function(_, bufnr)
	--print("LSP Started!")

	--vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
	vim.cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
	vim.cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')


	-- OLD
	-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover,
	-- { border = "single" })
	-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
	-- { border = "single" })

	-- NEW
	local popup_opts = { border = 'rounded', max_width = 80 }
	vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, popup_opts)
	vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.signature_help, popup_opts)


	if _.resolved_capabilities.document_formatting then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
		vim.api.nvim_command [[augroup END]]
	end

	-- TODO : repalce long commands with short variables
	local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
	local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
	local opts = { noremap = true, silent = true }

	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover({popup_opts = { border = "double" }})<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'v', '<leader>ca', '<cmd>lua vim.lsp.buf.range_code_action()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
	-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({popup_opts = { border = "single" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({popup_opts = { border = "single" })<CR>', opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>so', [[<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>qf', [[<cmd>lua require('telescope.builtin').quickfix()<CR>]], opts)
	vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>re', [[<cmd>lua require('telescope.builtin').registers()<CR>]], opts)

	--vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- vim.cmd [[nnoremap <buffer><silent> <C-space> :lua vim.lsp.diagnostic.show_line_diagnostics({ border = "single" })<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> ]g :lua vim.lsp.diagnostic.goto_next({ popup_opts = { border = "single" }})<CR>]]
-- vim.cmd [[nnoremap <buffer><silent> [g :lua vim.lsp.diagnostic.goto_prev({ popup_opts = { border = "single" }})<CR>]]


-- Sumneko_lua
local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end


local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lspconfig/sumneko_lua/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}

local tsscapabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
tsscapabilities.textDocument.completion.completionItem.snippetSupport = true
tsscapabilities.textDocument.completion.completionItem.preselectSupport = true
tsscapabilities.textDocument.completion.completionItem.insertReplaceSupport = true
tsscapabilities.textDocument.completion.completionItem.labelDetailsSupport = true
tsscapabilities.textDocument.completion.completionItem.deprecatedSupport = true
tsscapabilities.textDocument.completion.completionItem.commitCharactersSupport = true
tsscapabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
tsscapabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		'documentation',
		'detail',
		'additionalTextEdits',
	}
}



nvim_lsp.tsserver.setup {
	capabilities = tsscapabilities,
	cmd = { 'typescript-language-server', '--stdio'},
	filetypes = {
		"javascript",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx" },
	init_options = {
		hostInfo = "neovim"
	},
	on_attach = function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
		buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

		ts_utils.setup {
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,
			import_all_timeout = 5000, -- ms

			-- eslint
			eslint_enable_code_actions = false,
			eslint_enable_disable_comments = false,
			eslint_bin = 'eslint_d',
			eslint_config_fallback = nil,
			eslint_enable_diagnostics = false,
			eslint_opts = {
				-- diagnostics_format = "#{m} [#{c}]",
				condition = function(utils)
					return utils.root_has_file(".eslintrc.js")
				end,
			},

			-- formatting
			enable_formatting = false,
			formatter = 'prettier_d_slim',
			formatter_config_fallback = nil,

			-- parentheses completion
			-----------
			complete_parens = true,
			signature_help_in_parens = true,

			-- update imports on file move
			update_imports_on_move = true,
			require_confirmation_on_move = true,
			watch_dir = nil,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = { "hint" },
			filter_out_diagnostics_by_code = {},
		}

		ts_utils.setup_client(client)
	end

	--root_dir = root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git")
}

nvim_lsp.jsonls.setup {
	commands = {
		Format = {
			function()
				vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
			end
		}
	}
}
nvim_lsp.dockerls.setup {
	-- on_attach = on_attach,
	-- capabilities = capabilities,
	cmd = { "docker-langserver", "--stdio" },
	filetypes = { "Dockerfile", "dockerfile" },
	--  root_dir = root_pattern("Dockerfile"),

	--  local configs = require 'lspconfig/configs'
	--  local util = require 'lspconfig/util'
	--
	--local server_name = "dockerls"
	--  local bin_name = "docker-langserver"
}


nvim_lsp.diagnosticls.setup {
	-- on_attach = on_attach,
	-- capabilities = capabilities,
	filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
	init_options = {
		linters = {
			eslint = {
				command = 'eslint_d',
				rootPatterns = { '.git', 'package.json' },
				debounce = 100,
				args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
				sourceName = 'eslint_d',
				parseJson = {
					errorsRoot = '[0].messages',
					line = 'line',
					column = 'column',
					endLine = 'endLine',
					endColumn = 'endColumn',
					message = '[eslint] ${message} [${ruleId}]',
					security = 'severity'
				},
				securities = {
					[2] = 'error',
					[1] = 'warning'
				}
			},
		},

		filetypes = {
			javascript = 'eslint',
			javascriptreact = 'eslint',
			typescript = 'eslint',
			typescriptreact = 'eslint',
		},

		formatters = {
			eslint_d = {
				command = 'eslint_d',
				args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
				rootPatterns = { '.git' },
			},
			prettier = {
				command = 'prettier',
				args = { '--stdin-filepath', '%filename' }
			}
		},

		formatFiletypes = {
			css = 'prettier',
			javascript = 'eslint_d',
			javascriptreact = 'eslint_d',
			json = 'prettier',
			scss = 'prettier',
			less = 'prettier',
			typescript = 'eslint_d',
			typescriptreact = 'eslint_d',
			markdown = 'prettier',
		}
	}
}

nvim_lsp.rust_analyzer.setup ({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		["rust-analyzer"] = {
			assist = {
				importGranularity = "module",
				importPrefix = "by_self",
			},
			cargo = {
				loadOutDirsFromCheck = true
			},
			procMacro = {
				enable = true
			},
		}
	}
})

nvim_lsp.rls.setup {
	on_atttach = on_attach,
	capabilities = capabilities

}

require('rust-tools').setup({})


nvim_lsp.vimls.setup{
	on_attach = on_attach,
	cmd = { "vim-language-server", "--stdio" },
	filetypes = { "vim" },
	init_options = {
		diagnostics = {
			enable = true
		},
		indexes = {
			count = 3,
			gap = 100,
			projectRootPatterns = { "runtime", "nvim", ".git", "autoload", "plugin" },
			runtimepath = true
		},
		iskeyword = "@,48-57,_,192-255,-#",
		runtimepath = "",
		suggest = {
			fromRuntimepath = true,
			fromVimruntime = true
		},
		vimruntime = ""
	},
	--    root_dir = function(fname)
	--          return util.find_git_ancestor(fname) or vim.fn.getcwd()
	--        end,
}


nvim_lsp.yamlls.setup{
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml" },
	--  root_dir = root_pattern(".git", vim.fn.getcwd())
}


nvim_lsp.jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	-- cmd = {
	-- 	jvm_args = {
	-- 		"-javaagent:" .. tostring(vim.fn.getenv("LOMBOK_JAR")) .. " -Xbootclasspath/a:" .. tostring(vim.fn.getenv("LOMBOK_JAR"))
	-- 	}
	-- }
})

local servers = { 'pyright', 'rust_analyzer', 'tsserver', 'bashls', 'html', 'cssls', 'dockerls', 'sumneko_lua' }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup {
		on_attach = on_attach,
		capabilities = capabilities,
		flags = {
			debounce_text_changes = 150,
		}
	}
end
