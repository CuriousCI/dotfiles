vim.cmd [[packadd packer.nvim]]

require('mason').setup()

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use 'ellisonleao/gruvbox.nvim'

    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'

    use 'neovim/nvim-lspconfig'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'

    use 'L3MON4D3/LuaSnip'
    use 'rafamadriz/friendly-snippets'

    use 'simrat39/rust-tools.nvim'
    use 'p00f/clangd_extensions.nvim'

    use 'nvim-telescope/telescope.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'

    use 'mfussenegger/nvim-jdtls'
    use 'mfussenegger/nvim-dap'
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function()
            require 'trouble'.setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    use {
        'numToStr/Comment.nvim',
        config = function()
            require 'Comment'.setup()
        end
    }
end)
