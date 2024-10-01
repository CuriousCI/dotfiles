vim.cmd [[packadd packer.nvim]]

return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'williamboman/mason.nvim'

    use 'neovim/nvim-lspconfig'
    use 'mfussenegger/nvim-jdtls'
    use { 'mrcjkb/rustaceanvim', ft = { 'rust' } }
    use { 'kaarmu/typst.vim', ft = { 'typst' } }

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    use 'folke/trouble.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use 'christoomey/vim-tmux-navigator'
    use 'nvim-telescope/telescope.nvim'
    use 'numToStr/Comment.nvim'
end)
