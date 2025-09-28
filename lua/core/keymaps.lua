-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Save file
vim.keymap.set('n', '<C-s>', '<cmd> w <CR>', { noremap = true, silent = true, desc = 'Save file' })

-- save file without auto-formatting
vim.keymap.set('n', '<C-S-s>', '<cmd>noautocmd w <CR>', { noremap = true, silent = true, desc = 'Save file without auto-formatting' })

-- quit file
vim.keymap.set('n', '<C-q>', '<cmd> q <CR>', { noremap = true, silent = true })

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>bq', ':bdelete!<CR>', { noremap = true, silent = true, desc = 'Close buffer' }) -- close buffer
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', { noremap = true, silent = true, desc = 'New buffer' }) -- new buffer

-- Resize with arrows
vim.keymap.set('n', '<S-Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Window management
vim.keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, silent = true }) -- split window vertically
vim.keymap.set('n', '<leader>wh', '<C-w>s', { noremap = true, silent = true }) -- split window horizontally
vim.keymap.set('n', '<leader>wse', '<C-w>=', { noremap = true, silent = true }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>wq', ':close<CR>', { noremap = true, silent = true }) -- close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Tabs
vim.keymap.set('n', '<leader>Wo', ':tabnew<CR>', { noremap = true, silent = true }) -- open new tab
vim.keymap.set('n', '<leader>Wx', ':tabclose<CR>', { noremap = true, silent = true }) -- close current tab
vim.keymap.set('n', '<leader>Wn', ':tabn<CR>', { noremap = true, silent = true }) --  go to next tab
vim.keymap.set('n', '<leader>Wp', ':tabp<CR>', { noremap = true, silent = true }) --  go to previous tab

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- Keep last yanked when pasting
vim.keymap.set('v', 'p', '"_dP', { noremap = true, silent = true })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Go to previous diagnostic message' })

vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Go to next diagnostic message' })

vim.keymap.set('n', '<leader>if', vim.diagnostic.open_float, { desc = 'Issues: Open [f]loating diagnostic message' })
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'Code: Open diagnostic [Q]uickfix list' })

-- Optional: Bind the function to a keybinding (e.g., <leader>mi)
vim.api.nvim_set_keymap('n', '<leader>pmi', ':MasonInstallAll<CR>', { desc = '[M]ason [I]nstall All', noremap = true, silent = true })
-- Toggle line wrapping
vim.keymap.set('n', '<leader>cw', '<cmd>set wrap!<CR>', { noremap = true, silent = true })
