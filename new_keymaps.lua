local builtin = require 'telescope.builtin'
local dap, dapui = require 'dap', require 'dapui'
local neotest = require 'neotest'

-- General
vim.keymap.set('n', '<C-s>', '<cmd>w<CR>', { desc = 'Save file' })
vim.keymap.set('n', '<C-q>', '<cmd>q<CR>', { desc = 'Quit file' })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear highlights' })
vim.keymap.set('n', '<Tab>', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<C-f>', ':SearchBoxIncSearch<CR>', { desc = 'SearchBox: Search' })
vim.keymap.set('n', '<C-h>', ':SearchBoxReplace<CR>', { desc = 'SearchBox: Replace' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Buffers
vim.keymap.set('n', '<leader>bb', '<cmd>enew<CR>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>bd', ':bdelete!<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<leader>bn', '<cmd>noautocmd w<CR>', { desc = 'Save no-format' })

-- Windows
vim.keymap.set('n', '<leader>ws', '<C-w>s', { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>wv', '<C-w>v', { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>we', '<C-w>=', { desc = 'Equalize splits' })
vim.keymap.set('n', '<leader>wc', ':close<CR>', { desc = 'Close split' })

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', { desc = 'Open tab' })
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', { desc = 'Prev tab' })

-- Tests
vim.keymap.set('n', '<leader>tr', function()
  neotest.run.run()
end, { desc = 'Run nearest test' })
vim.keymap.set('n', '<leader>tf', function()
  neotest.run.run(vim.fn.expand '%')
end, { desc = 'Run file tests' })
vim.keymap.set('n', '<leader>to', function()
  neotest.output.open { enter = true }
end, { desc = 'Show test output' })

-- Toggles
vim.keymap.set('n', '<leader>Tw', '<cmd>set wrap!<CR>', { desc = 'Toggle wrap' })
vim.keymap.set('n', '<leader>Tb', function()
  require('gitsigns').toggle_current_line_blame()
end, { desc = 'Toggle blame' })
vim.keymap.set('n', '<leader>Td', function()
  require('gitsigns').preview_hunk_inline()
end, { desc = 'Toggle deleted' })
vim.keymap.set('n', '<leader>Th', function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = 'Toggle hints' })

-- Search (Telescope)
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Help' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Keymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Files' })
vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Select builtin' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Current word' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Live grep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Diagnostics' })
vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Resume' })
vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = 'Old files' })
vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>sn', function()
  builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = 'Neovim config' })
vim.keymap.set('n', '<leader>s/', function()
  builtin.live_grep { grep_open_files = true, prompt_title = 'Live grep in open files' }
end, { desc = 'Grep open files' })
vim.keymap.set('n', '<leader>/', function()
  builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Search in buffer' })

-- Git (gitsigns)
vim.keymap.set('n', ']c', function()
  if vim.wo.diff then
    vim.cmd.normal { ']c', bang = true }
  else
    require('gitsigns').nav_hunk 'next'
  end
end, { desc = 'Next git change' })
vim.keymap.set('n', '[c', function()
  if vim.wo.diff then
    vim.cmd.normal { '[c', bang = true }
  else
    require('gitsigns').nav_hunk 'prev'
  end
end, { desc = 'Prev git change' })

vim.keymap.set('n', '<leader>gs', function()
  require('gitsigns').stage_hunk()
end, { desc = 'Stage hunk' })
vim.keymap.set('n', '<leader>gr', function()
  require('gitsigns').reset_hunk()
end, { desc = 'Reset hunk' })
vim.keymap.set('n', '<leader>gS', function()
  require('gitsigns').stage_buffer()
end, { desc = 'Stage buffer' })
vim.keymap.set('n', '<leader>gu', function()
  require('gitsigns').undo_stage_hunk()
end, { desc = 'Undo stage' })
vim.keymap.set('n', '<leader>gR', function()
  require('gitsigns').reset_buffer()
end, { desc = 'Reset buffer' })
vim.keymap.set('n', '<leader>gp', function()
  require('gitsigns').preview_hunk()
end, { desc = 'Preview hunk' })
vim.keymap.set('n', '<leader>gb', function()
  require('gitsigns').blame_line()
end, { desc = 'Blame line' })
vim.keymap.set('n', '<leader>gd', function()
  require('gitsigns').diffthis()
end, { desc = 'Diff index' })
vim.keymap.set('n', '<leader>gD', function()
  require('gitsigns').diffthis '~'
end, { desc = 'Diff last commit' })

-- Diagnostics
vim.keymap.set('n', '<leader>dd', vim.diagnostic.open_float, { desc = 'Show float' })
vim.keymap.set('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Quickfix list' })
vim.keymap.set('n', '[d', function()
  vim.diagnostic.jump { count = -1, float = true }
end, { desc = 'Prev diagnostic' })
vim.keymap.set('n', ']d', function()
  vim.diagnostic.jump { count = 1, float = true }
end, { desc = 'Next diagnostic' })

-- Debug (DAP)
vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dO', dap.step_over, { desc = 'Step over' })
vim.keymap.set('n', '<leader>dC', dap.run_to_cursor, { desc = 'Run to cursor' })
vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle REPL' })
vim.keymap.set('n', '<leader>dj', dap.down, { desc = 'Stack down' })
vim.keymap.set('n', '<leader>dk', dap.up, { desc = 'Stack up' })
vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle UI' })
vim.keymap.set('n', '<leader>dT', function()
  dap.terminate()
  dap.clear_breakpoints()
end, { desc = 'Terminate + Clear' })

-- LSP
vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, { desc = 'Rename' })
vim.keymap.set({ 'n', 'x' }, '<leader>la', vim.lsp.buf.code_action, { desc = 'Code action' })
vim.keymap.set('n', '<leader>lR', builtin.lsp_references, { desc = 'References' })
vim.keymap.set('n', '<leader>li', builtin.lsp_implementations, { desc = 'Implementation' })
vim.keymap.set('n', '<leader>ld', builtin.lsp_definitions, { desc = 'Definition' })
vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, { desc = 'Declaration' })
vim.keymap.set('n', '<leader>lo', builtin.lsp_document_symbols, { desc = 'Document symbols' })
vim.keymap.set('n', '<leader>lW', builtin.lsp_dynamic_workspace_symbols, { desc = 'Workspace symbols' })
vim.keymap.set('n', '<leader>lt', builtin.lsp_type_definitions, { desc = 'Type definition' })

-- Plugins
vim.keymap.set('n', '<leader>pm', ':MasonInstallAll<CR>', { desc = 'Mason install' })
vim.keymap.set('n', '<leader>pt', toggle_transparency, { desc = 'Toggle transparency' })

-- Neo-tree
vim.keymap.set('n', '<leader>ee', '<cmd>Neotree toggle position=left<CR>', { desc = 'Explorer (files)' })
vim.keymap.set('n', '<leader>eg', '<cmd>Neotree float git_status<CR>', { desc = 'Explorer (git)' })
vim.keymap.set('n', '<leader>eb', '<cmd>Neotree float buffers<CR>', { desc = 'Explorer (buffers)' })
vim.keymap.set('n', '<leader>ef', '<cmd>Neotree focus<CR>', { desc = 'Explorer (focus)' })
vim.keymap.set('n', '<leader>ec', '<cmd>Neotree close<CR>', { desc = 'Explorer (close)' })
