return {
  {
    'polirritmico/dashboard-nvim', -- nvimdev
    cmd = 'Dashboard',
    lazy = false,
    opts = function()
      local opts = {
        theme = 'doom',
        hide = {
          statusline = false, -- handled by Lualine itself
        },
        config = {
          vertical_center = true,
          header = {
            '',
            [[Neovim :: P R A G N E T I C   @  2025]],
            '',
            '',
          },
          center = {
            {
              action = 'ene | startinsert',
              desc = ' New file',
              icon = ' ',
              key = 'e',
            },
            {
              action = 'Telescope find_files',
              desc = ' Find file',
              icon = ' ',
              key = '<leader>ff',
            },
            {
              action = 'Telescope oldfiles',
              desc = ' Recent files',
              icon = ' ',
              key = '<leader>fr',
            },
            {
              action = 'Telescope find_files cwd=~/.config/nvim',
              desc = ' Config files',
              icon = ' ',
              key = '<leader>cc',
            },
            {
              action = 'Lazy',
              desc = ' Lazy',
              icon = '󰒲 ',
              key = '<leader>cl',
            },
            { action = 'qa', desc = ' Quit', icon = ' ', key = 'q' },
          },
          footer = function()
            local stats = require('lazy').stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            -- stylua: ignore
            return { "⚡ Neovim loaded "..stats.loaded.."/"..stats.count.." plugins in "..ms.."ms" }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(' ', 43 - #button.desc)
        button.key_format = '  %s'
      end

      return opts
    end,
  },
}
