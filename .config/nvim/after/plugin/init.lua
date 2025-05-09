require 'mason'.setup {}

require 'telescope'.setup {
    defaults = {
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt_prefix = ' ',
        selection_caret = ' ',
        entry_prefix = ' ',
        multi_icon = ' ',
    }
}

require 'trouble'.setup {
    auto_close = true,
    icons = {
        indent = { middle = '', last = '', top = '', ws = '   ' },
        folder_closed = '',
        folder_open = '',
    },
}

require 'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
    },
    indent = { enable = true }
}
