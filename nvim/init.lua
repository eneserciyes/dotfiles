vim.o.number = true
vim.o.relativenumber = true
vim.o.ignorecase = true
vim.o.wrap = false
vim.o.winborder = "rounded"
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.termguicolors = true
vim.o.swapfile = false
vim.o.signcolumn = "yes"
vim.o.undofile = true
vim.o.incsearch = true
vim.o.hlsearch = false

local map = vim.keymap.set

vim.g.mapleader = " "
map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')

vim.cmd(":hi statusline guibg=None")

-- Plugins
vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.pick" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
})

require("vague").setup({ transparent = true })
vim.cmd('colorscheme vague')

require("mason").setup()
require("mini.pick").setup()
require("oil").setup()
require("supermaven-nvim").setup({})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=noselect")


vim.lsp.enable({ "lua_ls", "basedpyright", "clangd" })

map('n', '<leader>lf', vim.lsp.buf.format)
map('n', '<leader>f', ':Pick files tool=\'git\'<CR>')
map('n', '<leader>b', ':Pick buffers<CR>')
map('n', '<leader>rg', ':Pick grep_live<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>e', ':Oil<CR>')
