local opts = { noremap = true, silent = true }
local telescope = require 'telescope.builtin'

vim.keymap.set('n', 'ca', vim.lsp.buf.code_action)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
vim.keymap.set('n', 'ds', vim.lsp.buf.document_symbol)
vim.keymap.set('n', 'K', vim.lsp.buf.hover)
vim.keymap.set('n', '<leader>I', vim.lsp.buf.implementation)
vim.keymap.set('n', '<leader>r', vim.lsp.buf.references)
vim.keymap.set('n', '<leader>R', vim.lsp.buf.rename)
vim.keymap.set('n', 'sh', vim.lsp.buf.signature_help)
vim.keymap.set('n', 'td', vim.lsp.buf.type_definition)

vim.keymap.set('n', '<leader>D', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_next)
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev)

vim.keymap.set('n', '<leader>t', function() vim.cmd [[Trouble diagnostics toggle]] end, opts)

vim.keymap.set('n', '<leader>f', telescope.find_files)
vim.keymap.set('n', '<leader>g', telescope.live_grep)

vim.keymap.set('n', '<leader>v', vim.cmd.Ex)
vim.keymap.set('n', 'Q', vim.cmd.q)

vim.keymap.set('n', '<leader>i', function() vim.cmd [[bo vs]] end, opts)

vim.keymap.set('n', '\\', function() vim.cmd [[vert res +20]] end, opts)
vim.keymap.set('n', '|', function() vim.cmd [[vert res -20]] end, opts)

vim.keymap.set('n', '<leader>p', function()
    vim.cmd [[Vexplore!]]
    telescope.find_files()
end, opts)

vim.keymap.set('n', '<leader>d', function()
    vim.cmd [[Hexplore]]
    telescope.find_files()
end, opts)

vim.keymap.set('n', '<leader>i', function()
    vim.cmd [[Vexplore!]]
end, opts)

vim.keymap.set('n', '<leader>-', function()
    vim.cmd [[Hexplore]]
end, opts)

-- vim.cmd [[vs]]
-- vim.cmd [[sp]]
