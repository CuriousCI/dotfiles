vim.g.mapleader = ' '
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 0
vim.g.typst_pdf_viewer = 'firefox'

-- vim.o.background = "light"
vim.o.conceallevel = 2
vim.o.confirm = true
vim.o.ignorecase = true
vim.o.shiftround = true
vim.o.shiftwidth = 0
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.tabstop = 4

vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true
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

-- See `:h 'statusline'` for more information about statusline.

vim.lsp.inlay_hint.enable()

vim.diagnostic.config {
    virtual_text = true,
    signs = false,
    float = {
        header = '',
        prefix = '',
    },
    update_in_insert = true,
    severity_sort = true,
}


vim.filetype.add { pattern = { ['api.*%.ya?ml'] = 'yaml.openapi' }, }

vim.api.nvim_create_autocmd('BufWritePre', { callback = function() vim.lsp.buf.format() end })
vim.api.nvim_create_autocmd('CursorHold',
    { callback = function() vim.diagnostic.open_float(nil, { focusable = false }) end })
vim.api.nvim_create_autocmd('VimResized', { callback = function() vim.cmd [[ wincmd = ]] end })
vim.api.nvim_create_autocmd('FileType',
    { pattern = 'c,cpp,cuda', callback = function() vim.bo.commentstring = '// %s' end })

local function zellij_switch_mode(mode)
    return function()
        if vim.env.ZELLIJ ~= nil then
            vim.fn.system({ 'zellij', 'action', 'switch-mode', mode })
        end
    end
end

vim.api.nvim_create_autocmd('FocusGained', { callback = zellij_switch_mode('locked') })
vim.api.nvim_create_autocmd('FocusLost', { callback = zellij_switch_mode('normal') })
vim.api.nvim_create_autocmd('VimLeave', { callback = zellij_switch_mode('normal') })

if vim.env.ZELLIJ ~= nil then
    zellij_switch_mode('locked')()
end

vim.cmd [[
    set clipboard+=unnamedplus
    tnoremap <Esc> <C-\><C-n>
]]
