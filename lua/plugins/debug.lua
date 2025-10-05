return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    -- 'rcarriga/nvim-dap-ui',
    'jay-babu/mason-nvim-dap.nvim',
    'rouge8/neotest-rust',
    {
      'nvim-neotest/neotest',
      requires = {
        {
          'Issafalcon/neotest-dotnet',
          'rouge8/neotest-rust',
        },
      },
      dependencies = {
        'nvim-neotest/nvim-nio',
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
      },
    },
    {
      'Issafalcon/neotest-dotnet',
      lazy = false,
      dependencies = {
        'nvim-neotest/neotest',
      },
    },
    {
      'igorlfs/nvim-dap-view',
      ---@module 'dap-view'
      ---@type dapview.Config
      opts = {
        winbar = {
          show = true,
          -- You can add a "console" section to merge the terminal with the other views
          sections = { 'watches', 'scopes', 'exceptions', 'breakpoints', 'threads', 'repl', 'console' },
          -- Must be one of the sections declared above
          default_section = 'watches',
          -- Configure each section individually
          base_sections = {
            breakpoints = {
              keymap = 'B',
              label = 'Breakpoints [B]',
              short_label = ' [B]',
              action = function()
                require('dap-view.views').switch_to_view 'breakpoints'
              end,
            },
            scopes = {
              keymap = 'S',
              label = 'Scopes [S]',
              short_label = '󰂥 [S]',
              action = function()
                require('dap-view.views').switch_to_view 'scopes'
              end,
            },
            exceptions = {
              keymap = 'E',
              label = 'Exceptions [E]',
              short_label = '󰢃 [E]',
              action = function()
                require('dap-view.views').switch_to_view 'exceptions'
              end,
            },
            watches = {
              keymap = 'W',
              label = 'Watches [W]',
              short_label = '󰛐 [W]',
              action = function()
                require('dap-view.views').switch_to_view 'watches'
              end,
            },
            threads = {
              keymap = 'T',
              label = 'Threads [T]',
              short_label = '󱉯 [T]',
              action = function()
                require('dap-view.views').switch_to_view 'threads'
              end,
            },
            repl = {
              keymap = 'R',
              label = 'REPL [R]',
              short_label = '󰯃 [R]',
              action = function()
                require('dap-view.repl').show()
              end,
            },
            sessions = {
              keymap = 'K', -- I ran out of mnemonics
              label = 'Sessions [K]',
              short_label = ' [K]',
              action = function()
                require('dap-view.views').switch_to_view 'sessions'
              end,
            },
            console = {
              keymap = 'C',
              label = 'Console [C]',
              short_label = '󰆍 [C]',
              action = function()
                require('dap-view.views').switch_to_view 'console'
              end,
            },
          },
          -- Add your own sections
          custom_sections = {},
          controls = {
            enabled = true,
            position = 'right',
            buttons = {
              'play',
              'step_into',
              'step_over',
              'step_out',
              'step_back',
              'run_last',
              'terminate',
              'disconnect',
            },
            custom_buttons = {},
          },
        },
        windows = {
          height = 0.25,
          position = 'below',
          terminal = {
            width = 0.5,
            position = 'left',
            -- List of debug adapters for which the terminal should be ALWAYS hidden
            hide = {},
            -- Hide the terminal when starting a new session
            start_hidden = true,
          },
        },
        icons = {
          disabled = '',
          disconnect = '',
          enabled = '',
          filter = '󰈲',
          negate = ' ',
          pause = '',
          play = '',
          run_last = '',
          step_back = '',
          step_into = '',
          step_out = '',
          step_over = '',
          terminate = '',
        },
        help = {
          border = nil,
        },
        -- Controls how to jump when selecting a breakpoint or navigating the stack
        -- Comma separated list, like the built-in 'switchbuf'. See :help 'switchbuf'
        -- Only a subset of the options is available: newtab, useopen, usetab and uselast
        -- Can also be a function that takes the current winnr and the bufnr that will jumped to
        -- If a function, should return the winnr of the destination window
        switchbuf = 'usetab',
        -- Auto open when a session is started and auto close when all sessions finish
        auto_toggle = false,
        -- Reopen dapview when switching tabs
        follow_tab = false,
      },
    },
  },
  priority = 750,
  config = function()
    -- local dap, dapui = require 'dap', require 'dapui
    local dap = require 'dap'

    vim.fn.sign_define('DapBreakpoint', {
      text = '🔴',
      texthl = 'DapBreakpointSymbol',
      linehl = 'DapBreakpoint',
      numhl = 'DapBreakpoint',
    })

    vim.fn.sign_define('DapStopped', {
      text = '⭕',
      texthl = 'yellow',
      linehl = 'DapBreakpoint',
      numhl = 'DapBreakpoint',
    })
    vim.fn.sign_define('DapBreakpointRejected', {
      text = '⚪',
      texthl = 'DapStoppedSymbol',
      linehl = 'DapBreakpoint',
      numhl = 'DapBreakpoint',
    })

    -- dapui.setup {
    --   expand_lines = true,
    --   controls = { enabled = true },
    --   floating = { border = 'single' },

    --   -- Only one layout: just the "scopes" (variables) list at the bottom
    --   layouts = {
    --     {
    --       elements = {
    --         {
    --           id = 'scopes',
    --           size = 0.25,
    --         },
    --         {
    --           id = 'breakpoints',
    --           size = 0.25,
    --         },
    --         {
    --           id = 'stacks',
    --           size = 0.25,
    --         },
    --         {
    --           id = 'watches',
    --           size = 0.25,
    --         },
    --       },
    --       position = 'left',
    --       size = 40,
    --     },
    --     {
    --       elements = {
    --         -- {
    --         --   id = 'repl',
    --         --   size = 0.5,
    --         -- },
    --         {
    --           id = 'console',
    --           size = 0.5,
    --         },
    --       },
    --       position = 'bottom',
    --       size = 10,
    --     },
    --   },
    -- }
    -- === General Keymaps ===
    local map = vim.keymap.set

    vim.keymap.set('n', '<leader>dq', function()
      dap.terminate()
      dap.clear_breakpoints()
    end, { desc = 'Terminate and clear breakpoints' })

    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Start/[c]ontinue debugging' })
    vim.keymap.set('n', '<F5>', dap.continue, { desc = 'Start/[c]ontinue debugging' })
    vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Step over ([n]ext)' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step [i]nto' })
    vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Step [o]ut' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [b]reakpoint' })
    vim.keymap.set('n', '<leader>dC', dap.run_to_cursor, { desc = 'Run to [c]ursor' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle DAP [R]EPL' })
    vim.keymap.set('n', '<leader>dj', dap.down, { desc = 'Go down stack frame' })
    vim.keymap.set('n', '<leader>dk', dap.up, { desc = 'Go up stack frame' })
    local opts = { noremap = true, silent = true }
    map('n', '<F6>', "<Cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>", opts)
    map('n', '<F9>', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
    map('n', '<F10>', "<Cmd>lua require'dap'.step_over()<CR>", opts)
    map('n', '<F11>', "<Cmd>lua require'dap'.step_into()<CR>", opts)
    map('n', '<F8>', "<Cmd>lua require'dap'.step_out()<CR>", opts)

    local dapView = require 'dap-view'
    -- Auto open/close
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapView.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function() end
    dap.listeners.before.event_exited['dapui_config'] = function() end

    -- Keymap to toggle manually
    vim.keymap.set('n', '<leader>du', dapView.toggle, { desc = 'Toggle DAP UI' })

    -- === Rust setup (new) ===
    require('mason-nvim-dap').setup {
      ensure_installed = { 'codelldb' },
      automatic_installation = true,
    }

    dap.adapters.codelldb = {
      type = 'server',
      port = '${port}',
      executable = {
        command = vim.fn.stdpath 'data' .. '/mason/bin/codelldb',
        args = { '--port', '${port}' },
      },
    }

    local netcoredbg_adapter = {
      type = 'executable',
      command = vim.fn.stdpath 'data' .. '/mason/packages/netcoredbg/netcoredbg',
      args = { '--interpreter=vscode' },
    }

    dap.adapters.netcoredbg = netcoredbg_adapter -- needed for normal debugging
    dap.adapters.coreclr = netcoredbg_adapter -- needed for unit test debugging
    dap.configurations.cs = {
      {
        type = 'coreclr',
        name = 'launch - netcoredbg',
        request = 'launch',
        program = function()
          vim.fn.jobstart 'dotnet build'
          return require('dap-dll-autopicker').build_dll_path()
        end,

        -- justMyCode = false,
        -- stopAtEntry = false,
        -- -- program = function()
        -- --   -- todo: request input from ui
        -- --   return "/path/to/your.dll"
        -- -- end,
        -- env = {
        --   ASPNETCORE_ENVIRONMENT = function()
        --     -- todo: request input from ui
        --     return "Development"
        --   end,
        --   ASPNETCORE_URLS = function()
        --     -- todo: request input from ui
        --     return "http://localhost:5050"
        --   end,
        -- },
        -- cwd = function()
        --   -- todo: request input from ui
        --   return vim.fn.getcwd()
        -- end,
      },
    }

    dap.configurations.rust = {
      {
        name = 'Debug executable',
        type = 'codelldb',
        request = 'launch',
        program = function()
          vim.fn.jobstart 'cargo build'
          return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
      },
    }
    -- === neotest for Rust ===
    local neotest = require 'neotest'
    neotest.setup {
      adapters = {
        require 'neotest-rust',
        require 'neotest-dotnet',
      },
    }
    vim.keymap.set('n', '<leader>tr', function()
      neotest.run.run()
    end, { desc = 'Run nearest [t]est' })
    vim.keymap.set('n', '<leader>tf', function()
      neotest.run.run(vim.fn.expand '%')
    end, { desc = 'Run [f]ile tests' })
    vim.keymap.set('n', '<leader>to', function()
      neotest.output.open { enter = true }
    end, { desc = 'Show test [o]utput' })
  end,
}
