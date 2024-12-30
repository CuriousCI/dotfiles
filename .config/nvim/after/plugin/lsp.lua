local lspconfig = require 'lspconfig'

local path = '/home/cicio/projects/vdmj-suite-4.6.0/'
local vers = '-4.6.0.jar'

require 'lspconfig.configs'.vdmsl = {
    default_config = {
        cmd = {
            'java',
            '-cp',
            table.concat({
                path .. 'vdmj' .. vers,
                path .. 'stdlib' .. vers,
                path .. 'annotations' .. vers,
                path .. 'annotations2' .. vers,
                path .. 'lsp' .. vers,
            }, ':'),
            'lsp.LSPServerStdio',
            '-vdmsl'
        },
        filetypes = { 'vdmsl' },
        name = 'vdmsl',
        root_dir = lspconfig.util.root_pattern("*.vdmsl"),
    },
}

require 'lspconfig.configs'.vdmpp = {
    default_config = {
        cmd = {
            'java',
            '-cp',
            table.concat({
                path .. 'vdmj' .. vers,
                path .. 'stdlib' .. vers,
                path .. 'annotations' .. vers,
                path .. 'annotations2' .. vers,
                path .. 'lsp' .. vers,
            }, ':'),
            'lsp.LSPServerStdio',
            '-vdmpp'
        },
        filetypes = { 'vdmpp' },
        name = 'vdmpp',
        root_dir = lspconfig.util.root_pattern("*.vdmpp"),
    },
}

require 'lspconfig.configs'.vdmrc = {
    default_config = {
        cmd = {
            'java',
            '-cp',
            table.concat({
                path .. 'vdmj' .. vers,
                path .. 'stdlib' .. vers,
                path .. 'annotations' .. vers,
                path .. 'annotations2' .. vers,
                path .. 'lsp' .. vers,
            }, ':'),
            'lsp.LSPServerStdio',
            '-vdmrc'
        },
        filetypes = { 'vdmrc' },
        name = 'vdmrc',
        root_dir = lspconfig.util.root_pattern("*.vdmrc"),
    },
}

require 'lspconfig'.vdmsl.setup {}
require 'lspconfig'.vdmpp.setup {}
require 'lspconfig'.vdmrc.setup {}

vim.filetype.add {
    pattern = {
        ['api.*%.ya?ml'] = 'yaml.openapi',
    },
}

require 'lspconfig'.hls.setup {}
require 'lspconfig'.html.setup {}
require 'lspconfig'.htmx.setup {}
require 'lspconfig'.gopls.setup {}
require 'lspconfig'.biome.setup {}
require 'lspconfig'.pylsp.setup {}
require 'lspconfig'.millet.setup {}
require 'lspconfig'.vacuum.setup {}
require 'lspconfig'.lua_ls.setup { settings = { Lua = { diagnostics = { globals = { 'vim' } } } } }
require 'lspconfig'.clangd.setup {}
require 'lspconfig'.tinymist.setup {
    on_attach = function(client, _) client.server_capabilities.semanticTokensProvider = nil end
}
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
