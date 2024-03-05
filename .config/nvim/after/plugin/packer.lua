vim.cmd [[packadd packer.nvim]]


return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use {
        'williamboman/mason.nvim',
        config = function() require 'mason'.setup() end

    }
    use 'ellisonleao/gruvbox.nvim'

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

    use 'mrcjkb/rustaceanvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-treesitter/nvim-treesitter'
    use {
        'stevearc/conform.nvim',
        config = function()
            require 'conform'.setup {
                formatters_by_ft = {
                    liquid = { 'prettierd' },
                    htmldjango = { 'djlint' }
                },
                format_after_save = {
                    lsp_fallback = true
                },
                async = true
            }
        end
    }
    use {
        'nvim-telescope/telescope.nvim',
        config = function()
            require 'telescope'.setup {
                defaults = {
                    borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
                    prompt_prefix = ' ',
                    selection_caret = ' ',
                    entry_prefix = ' ',
                    multi_icon = ' ',
                }
            }
        end
    }
    use {
        'folke/trouble.nvim',
        requires = 'nvim-tree/nvim-web-devicons',
        config = function() require 'trouble' end
    }
    use {
        'numToStr/Comment.nvim',
        config = function() require 'Comment'.setup() end
    }
end)
