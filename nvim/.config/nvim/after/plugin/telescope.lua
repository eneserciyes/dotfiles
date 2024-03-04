local builtin = require('telescope.builtin')
local telescope = require('telescope')

vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>ws', builtin.lsp_dynamic_workspace_symbols, {})
vim.keymap.set('n', '<leader>?', builtin.oldfiles, {desc = '[?] Find recently opened files'})
vim.keymap.set('n', '<leader>bb', builtin.buffers, {desc = '[bb] Find open buffers'})
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        winblend = 10,
        previewer = false,
    }))
end, {desc = '[/] Find in current buffer'})

