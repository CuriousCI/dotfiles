require 'luasnip.loaders.from_vscode'.lazy_load()
local cmp = require 'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require 'luasnip'.lsp_expand(args.body)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<Tab>'] = cmp.mapping.select_next_item(),

        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
        { name = 'buffer' },
    }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
        { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--         { name = 'buffer' }
--     }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = 'path' }
--     }, {
--         { name = 'cmdline' }
--     })
-- })

require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.tailwindcss.setup {}
require 'lspconfig'.svelte.setup {}
require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.intelephense.setup {}
require 'lspconfig'.tsserver.setup {}
require 'lspconfig'.lua_ls.setup {}
-- require 'lspconfig'.asm_lsp.setup {}

require 'clangd_extensions'.setup {
    server = {},
    extensions = {
        autoSetHints = true,
        inlay_hints = {
            only_current_line_autocmd = 'CursorHold',
            show_parameter_hints = true,
            parameter_hints_prefix = '',
            other_hints_prefix = '',
            max_len_align = false,
            max_len_align_padding = 0,
            right_align = false,
            right_align_padding = 0,
            highlight = 'Comment',
            priority = 100,
        },
        memory_usage = { border = 'none' },
        symbol_info = { border = 'none' },
    },
}
