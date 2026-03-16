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
vim.o.autoread = true
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" }) -- reload buffer on focus

local map = vim.keymap.set

vim.g.mapleader = " "
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
require("oil").setup(
	{
		lsp_file_methods = {
				enabled = true,
				timeout_ms = 1000,
				autosave_changes = true,
		},
		columns = {"icon"},
		float = {
			max_width = 0.3,
			max_height = 0.6,
			border = "rounded",
		},
	}
)
require("supermaven-nvim").setup({})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
vim.cmd("set completeopt+=menuone,noselect,popup")


vim.api.nvim_create_autocmd("FileType", {
	pattern = { "lua", "python", "c", "cpp", "rust", "gitignore", "gitcommit", "markdown", "help", "json", "yaml", "toml" },
	callback = function() vim.treesitter.start() end,
})

vim.lsp.enable({ "lua_ls", "basedpyright", "clangd", "ruff" })

-- Mappings
map('n', '<leader>lf', function()
	vim.lsp.buf.code_action({ context = { only = { "source.organizeImports.ruff" } }, apply = true })
	vim.defer_fn(function() vim.lsp.buf.format() vim.cmd("write") end, 100)
end)
map('n', '<leader>f', ':Pick files tool=\'git\'<CR>')
map('n', '<leader>b', ':Pick buffers<CR>')
map('n', '<leader>rg', ':Pick grep_live<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>e', ':Oil<CR>')

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
map('n', '<leader>q', ':quit<CR>')
map({ 'n', 'v', 'x' }, '<leader>y', '"+y<CR>')
map({ 'n', 'v', 'x' }, '<leader>d', '"+d<CR>')
map({ 'n', 'v', 'x' }, '<leader>s', ':e #<CR>')
map({ 'n', 'v', 'x' }, '<leader>S', ':sf #<CR>')
map({ "n", "t" }, "<Leader>x", "<Cmd>tabclose<CR>")

vim.cmd([[
nnoremap g= g+| " g=g=g= is less awkward than g+g+g+
noremap! <c-r><c-d> <c-r>=strftime('%F')<cr>
noremap! <c-r><c-t> <c-r>=strftime('%T')<cr>
noremap! <c-r><c-f> <c-r>=expand('%:t')<cr>
noremap! <c-r><c-p> <c-r>=expand('%:p')<cr>
xnoremap <expr> . "<esc><cmd>'<,'>normal! ".v:count1.'.<cr>'
]])

map("n", "gh", "0", { desc = "Jump: Start of line" })
map("n", "gl", "$", { desc = "Jump: End of line" })
vim.keymap.set("n", "yab", ":%y<CR>", {silent = true})
vim.keymap.set("n", "vab", "ggVG", { noremap = true, silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

map({ "n", "v", "x" }, "<CR>", ":", { desc = "Self explanatory" })

map({ "n", "v", "x" }, "<C-s>", [[:s/\V]], { desc = "Enter substitue mode in selection" })
map({ "v", "x", "n" }, "<C-y>", '"+y', { desc = "System clipboard yank." })
map({ "n" }, "<leader>c", "1z=")






