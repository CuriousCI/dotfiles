local opts = { noremap = true, silent = true }

-- Tools

vim.api.nvim_set_keymap('n', '<leader>f', [[<cmd>Telescope find_files<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>g', [[<cmd>Telescope live_grep<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>t', [[<cmd>TroubleToggle<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>v', [[<cmd>Explore<cr>]], opts)

vim.api.nvim_set_keymap('n', '<leader>q', [[<cmd>q<cr>]], opts)

-- Panels

vim.api.nvim_set_keymap('n', '<leader>i', [[<cmd>botright vs<cr>]], opts)
vim.api.nvim_set_keymap('n', '<leader>o', [[<cmd>botright vs<cr><cmd>lua require('telescope.builtin').live_grep()<cr>]],
    opts)
vim.api.nvim_set_keymap('n', '<leader>p', [[<cmd>botright vs<cr><cmd>lua require('telescope.builtin').find_files()<cr>]],
    opts)
vim.api.nvim_set_keymap('n', '<leader>d', [[<cmd>sp<cr><cmd>lua require('telescope.builtin').find_files()<cr>]], opts)

vim.api.nvim_set_keymap('n', '\\', [[<cmd>:vertical resize +20<cr>]], opts)
vim.api.nvim_set_keymap('n', '|', [[<cmd>:vertical resize -20<cr>]], opts)
