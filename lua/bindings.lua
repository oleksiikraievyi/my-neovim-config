vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.mapleader = " "

vim.keymap.set('n', '<leader>q', ':qa<CR>', { desc = 'Quit all' })
vim.keymap.set('n', '<leader>w', function()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins > 1 then
    vim.cmd('close')
  else
    vim.cmd('tabclose')
  end
end, { desc = 'Close split or tab' })
vim.keymap.set('n', '<', 'gv<', { desc = 'Reselect last visual selection' })
vim.keymap.set('n', '>', 'gv>', { desc = 'Reselect last visual selection' })

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', opts)
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', opts)
