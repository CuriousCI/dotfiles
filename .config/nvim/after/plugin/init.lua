vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function(args)
        require 'conform'.format { bufnr = args.buf }
    end,
})

vim.cmd [[
    set formatoptions-=cro
    set clipboard=unnamedplus

    autocmd BufNewFile,BufRead *.html set filetype=htmldjango
    autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
    colorscheme gruvbox
    TSEnable highlight
    tnoremap <Esc> <C-\><C-n>
    imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
    let g:copilot_no_tab_map = v:true
]]


-- " autocmd BufWritePre * lua vim.lsp.buf.format()
-- require 'nvim-tree'.setup {
--     diagnostics = { enable = true },
--     actions = {
--         open_file = {
--             quit_on_open = true,
--         },
--     },
-- }
-- use {
--     'nvim-tree/nvim-tree.lua',
--     requires = {
--         'nvim-tree/nvim-web-devicons', -- optional
--     },
-- }
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- ['<C-p>'] = require('telescope.actions.layout').toggle_preview
-- https://www.reddit.com/r/neovim/comments/w4qsju/toggle_preview_in_telescope/
-- vim.api.nvim_set_keymap('n', '<leader>v', [[<cmd>NvimTreeToggle<cr>]], opts)
-- vim.cmd [[
--     imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")
--     let g:copilot_no_tab_map = v:true
-- ]]
-- vim.keymap.set('i', '<C-.>', function() vim.diagnostic.open_float() end, opts)
-- Telescope
-- use 'williamboman/mason-lspconfig.nvim'
-- require 'mason-lspconfig'.setup {}
-- local lsp_capabilities = require 'cmp_nvim_lsp'.default_capabilities()
-- local lspconfig
-- require 'mason-lspconfig'.setup_handlers {
--     function(server_name)
--         lspconfig[server_name].setup({
--             on_attach = lsp_attach,
--             capabilities = lsp_capabilities,
--         })
--     end,
--}
-- TODO: install gem from void packages LOL
-- require 'lspconfig'.theme_check.setup {}
-- require 'lspconfig'.svelte.setup {}
-- require 'lspconfig'.tsserver.setup {}
-- require 'lspconfig'.intelephense.setup {}
-- require 'lspconfig'.clangd.setup {}
--
-- local lsp_capabilities = require 'cmp_nvim_lsp'.default_capabilities()
-- local lsp_attach = function(client, bufnr)
--     -- Create your keybindings here...
--     -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--     -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--     -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--     -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--     -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--     -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--     -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--     -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--     -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
-- end
--
-- local lspconfig = require 'lspconfig'
-- require 'mason-lspconfig'.setup_handlers {
--     function(server_name)
--         lspconfig[server_name].setup({
--             on_attach = lsp_attach,
--             capabilities = lsp_capabilities,
--         })
--     end,
-- }
-- Set configuration for specific filetype.
-- cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--         { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
--     }, {
--         { name = 'buffer' },
--     })
-- })

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
-- use 'p00f/clangd_extensions.nvim'
-- use 'simrat39/rust-tools.nvim'
-- require 'rust-tools'.setup {}
