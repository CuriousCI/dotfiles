require 'lspconfig'.html.setup {}
require 'lspconfig'.htmx.setup {}
require 'lspconfig'.biome.setup {}
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.millet.setup { settings = { initializationOptions = { fs_watcher = false } } }
require 'lspconfig'.lua_ls.setup { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.typst_lsp.setup {}
require 'lspconfig'.tailwindcss.setup {}
require 'lspconfig'.emmet_language_server.setup {}

local completion = require 'cmp'

completion.setup {
    window = {
        documentation = {
            border = { ' ', '─', ' ', ' ', ' ', '─', ' ', ' ' },
            winhighlight = 'FloatBorder:NormalFloat',
        }
    },
    mapping = completion.mapping.preset.insert({
        ['<C-b>'] = completion.mapping.scroll_docs(-4),
        ['<C-f>'] = completion.mapping.scroll_docs(4),
        ['<C-Space>'] = completion.mapping.complete(),
        ['<C-e>'] = completion.mapping.abort(),
        ['<CR>'] = completion.mapping.confirm({ select = true }),
        ['<S-Tab>'] = completion.mapping.select_prev_item(),
        ['<Tab>'] = completion.mapping.select_next_item(),
    }),
    sources = completion.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'nvim_lua' },
            { name = 'path' },
            { name = 'nvim_lsp_signature_help' }
        },
        {
            { name = 'buffer' }
        }
    ),
}
