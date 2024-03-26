vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
    vim.lsp.handlers.hover,
    { border = '' }
)

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
    vim.lsp.handlers.signature_help,
    { border = '' }
)

vim.diagnostic.config {
    virtual_text = true,
    signs = false,
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
        focusable = false,
        style = 'minimal',
        source = 'always',
        header = '',
        prefix = '',
        border = 'none',
    },
}

require 'luasnip.loaders.from_vscode'.lazy_load()
local cmp = require 'cmp'

cmp.setup {
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end,
    },
    window = {
        documentation = {
            border = { ' ', '─', ' ', ' ', ' ', '─', ' ', ' ' },
            winhighlight = 'FloatBorder:NormalFloat',
        }
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, { { name = 'buffer' } }),
}

require 'luasnip'.filetype_extend('htmldjango', { 'html' })
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.emmet_language_server.setup {
    filetypes = { 'liquid' }
}
require 'lspconfig'.lua_ls.setup { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.tailwindcss.setup {}
require 'nvim-treesitter.parsers'.get_parser_configs().liquid = {
    install_info = {
        url = "~/.config/nvim/.grammars/tree-sitter-liquid/",
        files = { 'src/parser.c' },
        branch = 'main',
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
    }
}
