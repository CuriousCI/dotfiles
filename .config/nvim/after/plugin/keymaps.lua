-- Telescope

require 'telescope'.setup {
    defaults = {
        border = {},
        borderchars = { '─', '│', '─', '│', '┌', '┐', '┘', '└' },
        prompt_prefix = ' ',
        entry_prefix = ' ',
    }
}
vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>lua require('telescope.builtin').find_files()<cr>]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>g', [[<cmd>lua require('telescope.builtin').live_grep()<cr>]],
    { noremap = true, silent = true })

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
    { silent = true, noremap = true }
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
    { silent = true, noremap = true }
)

-- Harpoon
-- require'harpoon'.setup{
--     menu = {
--         borderchars = {'─', '│', '─', '│', '┌', '┐', '┘', '└'},
--     }
-- }
-- vim.api.nvim_set_keymap('n', '<leader>h', [[<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>a', [[<cmd>lua require('harpoon.mark').add_file()<cr>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>n', [[<cmd>lua require('harpoon.ui').nav_next()<cr>]], { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>m', [[<cmd>lua require('harpoon.ui').nav_prev()<cr>]], { noremap = true, silent = true })

-- Comment
-- vim.api.nvim_set_keymap('n', '<c-_>', [[<cmd>lua require('Comment.api').toggle_current_linewise()<cr>]], { noremap = true, silent = true })

-- Neovim
vim.api.nvim_set_keymap('n', '<leader>v', [[<cmd>Ex<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', [[<cmd>q<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>s', [[<cmd>w<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', [[<cmd>botright vs<cr><cmd>lua require('telescope.builtin').find_files()<cr>]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', [[<cmd>sp<cr><cmd>lua require('telescope.builtin').find_files()<cr>]],
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>i', [[<cmd>botright vs<cr><cmd>Ex<cr>]], { noremap = true, silent = true })

-- Run
function run()
    filetype = vim.bo.filetype

    vim.cmd 'botright vs'

    if filetype == 'python' then
        vim.cmd 'term python %'
    elseif filetype == 'rust' then
        vim.cmd 'term cargo run'
    elseif filetype == 'java' then
        vim.cmd 'term javac %; java %:r'
    elseif filetype == 'cpp' then
        vim.cmd 'term clang++ % -o a; ./a'
    elseif filetype == 'c' then
        vim.cmd 'term clang % -o a; ./a'
    else
        vim.cmd 'term'
    end
end

vim.api.nvim_set_keymap('n', '<leader>r', [[<cmd>lua run()<cr>]], { noremap = true, silent = true })
-- C-\n to exit terminal

function test()
    filetype = vim.bo.filetype

    vim.cmd 'botright vs'

    if filetype == 'python' then
        vim.cmd 'term pytest test_01.py -vv -rA'
    elseif filetype == 'rust' then
        vim.cmd 'term cargo test'
        -- elseif filetype == 'cpp' then
        --     vim.cmd 'term clang++ % -o a; ./a'
        -- elseif filetype == 'c' then
        --     vim.cmd 'term clang % -o a; ./a'
    else
        vim.cmd 'term'
    end
end

vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>lua test()<cr>]], { noremap = true, silent = true })

-- Debug
-- Run tests w pytest, cargo test, etc...
-- vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd><cr>]], { noremap = true, silent = true })

-- Splits
--vim.api.nvim_set_keymap('n', '<leader>', [[<cmd>resize ()<cr>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>', [[<cmd>resize<cr>]], { noremap = true, silent = true })
