return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      -- Terminal size
      size = function(term)
        if term.direction == 'horizontal' then
          return 15
        elseif term.direction == 'vertical' then
          return math.floor(vim.o.columns * 0.4)
        end
      end,
      open_mapping = [[<c-\>]], -- default toggle key
      hide_numbers = true,
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      persist_size = true,
      direction = 'vertical', -- "horizontal" | "vertical" | "tab" | "float"
      close_on_exit = true,
      shell = vim.o.shell,
      float_opts = {
        border = 'curved',
        winblend = 20,
        highlights = {
          border = 'Normal',
          background = 'Normal',
        },
      },
    }

    -- Lazygit integration
    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new {
      cmd = 'lazygit',
      hidden = true,
      direction = 'float',
      float_opts = { border = 'double' },
    }

    function _lazygit_toggle()
      lazygit:toggle()
    end

    -- Keymaps
    vim.keymap.set('n', '<leader>rf', '<cmd>ToggleTerm direction=float<CR>', { desc = 'Floating terminal' })
    vim.keymap.set('n', '<leader>rt', '<cmd>ToggleTerm<cr>', { desc = 'Terminal' })
    vim.keymap.set('n', '<leader>rg', _lazygit_toggle, { desc = 'Lazygit' })
  end,
}
