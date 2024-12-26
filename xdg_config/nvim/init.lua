require("config.lazy")

vim.g.have_nerd_font = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.wrap = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 10
vim.opt.hlsearch = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'highlight when yanking',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})


-- Oil
vim.keymap.set("n", "<leader>pv", "<cmd>Oil<CR>")
