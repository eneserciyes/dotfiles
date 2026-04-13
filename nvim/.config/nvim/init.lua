--- Enes's Neovim config
----------------------------------------------
---  SETTINGS
----------------------------------------------
-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- No nerd font
vim.g.have_nerd_font = false

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- no need for mode
vim.o.showmode = false

-- case insensitive search unless	there is a capital letter
vim.o.ignorecase = true
vim.o.smartcase = true

-- no wrap
vim.o.wrap = false

-- decrease mapped sequence resolve timeoutlen
vim.o.timeoutlen = 200
vim.o.ttimeoutlen = 10

-- no mouse
vim.o.mouse = ""

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
-- vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- swapfile is annoying only
vim.o.swapfile = false

-- keep signcolumn on
vim.o.signcolumn = "yes"

-- better looking rounded borders
vim.o.winborder = "rounded"

-- Enable undo/redo changes even after closing and reopening a file
vim.o.undofile = true

-- Enable search as you type
vim.o.incsearch = true

-- reoload buffer on focus
vim.o.autoread = true
vim.api.nvim_create_autocmd("FocusGained", { command = "checktime" })

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
vim.o.confirm = true

-- Set statusline high and no background
vim.cmd(":hi statusline guibg=None")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function() vim.hl.on_yank() end,
})

----------------------------------------------
---  REMAPS
----------------------------------------------
local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>')

map('n', '<leader>lf', function()
	-- TODO: solve this with conform
	vim.lsp.buf.code_action({ context = { only = { "source.organizeImports.ruff" } }, apply = true })
	vim.defer_fn(function()
		vim.lsp.buf.format()
		vim.cmd("write")
	end, 100)
end)
map('n', '<leader>f', ':Pick files tool=\'git\'<CR>')
map('n', '<leader>b', ':Pick buffers<CR>')
map('n', '<leader>rg', ':Pick grep_live<CR>')
map('n', '<leader>h', ':Pick help<CR>')
map('n', '<leader>k', ':Pick keymaps<CR>')
map('n', '<leader>p', ':Pick oldfiles<CR>')
map('n', '<leader>e', ':Oil<CR>')

map('n', '<leader>o', ':update<CR> :source<CR>')
map('n', '<leader>w', ':write<CR>')
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
vim.keymap.set("n", "yab", ":%y<CR>", { silent = true })
vim.keymap.set("n", "vab", "ggVG", { noremap = true, silent = true })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

map({ "n", "v", "x" }, "<C-s>", [[:s/\V]], { desc = "Enter substitue mode in selection" })
map({ "v", "x", "n" }, "<C-y>", '"+y', { desc = "System clipboard yank." })
map({ "n" }, "<leader>c", "1z=")


----------------------------------------------
---  LSP & DIAGNOSTICS
----------------------------------------------
vim.diagnostic.config {
	update_in_insert = false,
	severity_sort = true,
	float = { border = 'rounded', source = 'if_many' },
	underline = { severity = { min = vim.diagnostic.severity.WARN } },

	-- Can switch between these as you prefer
	virtual_text = true, -- Text shows up at the end of the line
	virtual_lines = false, -- Text shows up underneath the line, with virtual lines

	-- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
	jump = { float = true },
}
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })



-- Plugins
vim.pack.add({
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/nvim-mini/mini.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/supermaven-inc/supermaven-nvim" },
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter" },
	{ src = "https://github.com/j-hui/fidget.nvim" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/akinsho/git-conflict.nvim" },
	{ src = "https://github.com/NMAC427/guess-indent.nvim" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
})

require("vague").setup({ transparent = true })
vim.cmd('colorscheme vague')

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})
require("mini.pick").setup()
require("mini.extra").setup()
require("mini.animate").setup({
	cursor = { enable = false },
	scroll = { enable = false },
})
require("mini.trailspace").setup()
local hipatterns = require("mini.hipatterns")
hipatterns.setup({
	highlighters = {
		fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
		hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
		todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
		note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})
require("oil").setup(
	{
		view_options = {
			show_hidden = true,
		},
		lsp_file_methods = {
			enabled = true,
			timeout_ms = 1000,
			autosave_changes = true,
		},
		columns = { "icon" },
		float = {
			max_width = 0.3,
			max_height = 0.6,
			border = "rounded",
		},
	}
)

require("supermaven-nvim").setup({
	keymaps = {
		accept_suggestion = "<C-j>",
		clear_suggestion = "<C-]>",
		accept_word = "<C-k>",
	},
	disable_keymaps = false,
})
require("fidget").setup({})
require("gitsigns").setup()
require("git-conflict").setup()
require("guess-indent").setup()
require("which-key").setup()

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-b>"] = { "scroll_documentation_up" },
		["<C-f>"] = { "scroll_documentation_down" },
		["<C-n>"] = { "show" },
		["<CR>"] = { "accept", "fallback" },
		["<Tab>"] = { "select_next", "fallback" },
		["<S-Tab>"] = { "select_prev", "fallback" },
	},
	completion = {
		list = {
			selection = { preselect = false, auto_insert = false },
		},
		menu = { border = "rounded" },
		documentation = {
			auto_show = true,
			window = { border = "rounded" },
		},
	},
	sources = {
		default = { "lsp", "path", "buffer" },
		per_filetype = {
			gitcommit = { "buffer" },
		},
	},
	cmdline = {
		sources = function()
			local type = vim.fn.getcmdtype()
			if type == "/" or type == "?" then
				return { "buffer" }
			end
			if type == ":" then
				return { "cmdline", "path" }
			end
			return {}
		end,
	},
	signature = { enabled = true },
})

vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		local opts = { buffer = args.buf }
		map('n', 'gd', vim.lsp.buf.definition, opts)
		map('n', 'gD', vim.lsp.buf.declaration, opts)
		map('n', 'gr', ':Pick lsp scope=\'references\'<CR>', opts)
		map('n', '<leader>rn', vim.lsp.buf.rename, opts)
		map('n', '<leader>ca', vim.lsp.buf.code_action, opts)
		map('n', 'K', vim.lsp.buf.hover, opts)
	end,
})



local lsp_servers = { "lua_ls", "basedpyright", "clangd", "ruff" }
vim.lsp.enable(lsp_servers)
map('n', '<leader>lt', function()
	local clients = vim.lsp.get_clients()
	if #clients > 0 then
		vim.lsp.stop_client(clients)
		print("LSP stopped")
	else
		vim.lsp.enable(lsp_servers)
		print("LSP started")
	end
end)
