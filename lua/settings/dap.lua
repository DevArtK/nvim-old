local dap = require('dap')

dap.adapters.node2 = {
	type = 'executable',
	command = 'node',
	args = '/usr/sbin'
}

dap.configurations.javascript = {
	{
		type = 'node2',
		request = 'launch',
		program = '${workspaceFolder}/${file}',
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = 'inspector',
		console = 'integratedTerminal',
	},
}

H.fn.sign_define('DapBreakpoint', {text='○', texthl='', linehl='', numhl=''})
H.fn.sign_define('DapStopped', {text='▬', texthl='', linehl='', numhl=''})
