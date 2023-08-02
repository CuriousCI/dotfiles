vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.smartindent = true
vim.opt.completeopt = { 'menuone', 'noselect', 'noinsert' }
vim.opt.shortmess = vim.opt.shortmess + { c = true }

vim.o.background = 'dark'
vim.cmd [[colorscheme gruvbox]]

-- clipboard+=unnamedplus

vim.api.nvim_set_option('updatetime', 150)

vim.diagnostic.config({
    virtual_text = true,
    underline = true,
    signs = false,
    update_in_insert = true,
    severity_sort = false,
    float = {
        source = 'always',
    }
})

vim.cmd [[
autocmd BufWritePre * lua vim.lsp.buf.format()
set signcolumn=yes
autocmd CursorHold * lua vim.diagnostic.open_float()
tnoremap <Esc> <C-\><C-n>
]]

require 'nvim-treesitter.configs'.setup {
    highlight = { enable = true },
    indent = { enable = true },
}

-- local cmp = require'cmp'
-- cmp.setup({
--   snippet = {
--     expand = function(args)
--         vim.fn['vsnip#anonymous'](args.body)
--     end,
--   },
--   mapping = {
--     ['<C-p>'] = cmp.mapping.select_prev_item(),
--     ['<C-n>'] = cmp.mapping.select_next_item(),
--     ['<C-S-f>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete(),
--     ['<C-e>'] = cmp.mapping.close(),
--     ['<CR>'] = cmp.mapping.confirm({
--       behavior = cmp.ConfirmBehavior.Insert,
--       select = true,
--     })
--   },
--   sources = {
--     { name = 'path' },                              -- file paths
--     { name = 'nvim_lsp', keyword_length = 3 },      -- from language server
--     { name = 'nvim_lsp_signature_help'},            -- display function signatures with current parameter emphasized
--     { name = 'nvim_lua', keyword_length = 2},       -- complete neovim's Lua runtime API such vim.lsp.*
--     { name = 'buffer', keyword_length = 2 },        -- source current buffer
--     { name = 'vsnip', keyword_length = 2 },         -- nvim-cmp source for vim-vsnip
--     { name = 'calc'},                               -- source for math calculation
--   },
--   formatting = {
--       fields = {'menu', 'abbr', 'kind'},
--   },
-- })
