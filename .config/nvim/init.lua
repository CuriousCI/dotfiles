vim.g.mapleader = ' '
vim.g.typst_pdf_viewer = 'firefox'
vim.o.conceallevel = 2
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'no'
vim.opt.isfname:append('@-@')
vim.opt.updatetime = 51
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
vim.opt.termguicolors = true
vim.cmd.colorscheme('gruvbox')
vim.background = 'light'

vim.cmd [[
    set clipboard+=unnamedplus
    tnoremap <Esc> <C-\><C-n>
    " set background=light
]]

vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*',
    callback = function() vim.lsp.buf.format() end
})

vim.api.nvim_create_autocmd('CursorHold', {
    pattern = '*',
    callback = function()
        vim.diagnostic.open_float(nil, { focusable = false })
    end
})

vim.lsp.inlay_hint.enable()

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
