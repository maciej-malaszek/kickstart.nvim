return {
  'mfussenegger/nvim-dap',
  dependencies = {
    'nvim-neotest/nvim-nio',
    'rcarriga/nvim-dap-ui',
    'jay-babu/mason-nvim-dap.nvim',
    'rouge8/neotest-rust',
    'nvim-neotest/neotest',
  },
  priority = 750,
  config = function()
    local dap, dapui = require 'dap', require 'dapui'

    -- === General Keymaps ===
    vim.keymap.set('n', '<leader>dq', function()
      dap.terminate()
      dap.clear_breakpoints()
    end, { desc = 'Terminate and clear breakpoints' })

    vim.keymap.set('n', '<leader>dc', dap.continue, { desc = 'Start/[c]ontinue debugging' })
    vim.keymap.set('n', '<leader>dn', dap.step_over, { desc = 'Step over ([n]ext)' })
    vim.keymap.set('n', '<leader>di', dap.step_into, { desc = 'Step [i]nto' })
    vim.keymap.set('n', '<leader>do', dap.step_out, { desc = 'Step [o]ut' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Toggle [b]reakpoint' })
    vim.keymap.set('n', '<leader>dC', dap.run_to_cursor, { desc = 'Run to [c]ursor' })
    vim.keymap.set('n', '<leader>dr', dap.repl.toggle, { desc = 'Toggle DAP [R]EPL' })
    vim.keymap.set('n', '<leader>dj', dap.down, { desc = 'Go down stack frame' })
    vim.keymap.set('n', '<leader>dk', dap.up, { desc = 'Go up stack frame' })
    dapui.setup()

    -- Auto open/close
    dap.listeners.after.event_initialized['dapui_config'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
      dapui.close()
    end

    -- Keymap to toggle manually
    vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = 'Toggle DAP UI' })
    -- === .NET setup (your existing config) ===
    require('easy-dotnet.netcoredbg').register_dap_variables_viewer()
    local dotnet = require 'easy-dotnet'
    local debug_dll = nil
    local function ensure_dll()
      if debug_dll ~= nil then
        return debug_dll
      end
      local dll = dotnet.get_debug_dll(true)
      debug_dll = dll
      return dll
    end

    for _, value in ipairs { 'cs', 'fsharp' } do
      dap.configurations[value] = {
        {
          type = 'coreclr',
          name = 'Program',
          request = 'launch',
          env = function()
            local dll = ensure_dll()
            return dotnet.get_environment_variables(dll.project_name, dll.relative_project_path) or nil
          end,
          program = function()
            local dll = ensure_dll()
            local co = coroutine.running()
            rebuild_project(co, dll.project_path)
            return dll.relative_dll_path
          end,
          cwd = function()
            return ensure_dll().relative_project_path
          end,
        },
        {
          type = 'coreclr',
          name = 'Test',
          request = 'attach',
          processId = function()
            local res = require('easy-dotnet').experimental.start_debugging_test_project()
            return res.process_id
          end,
        },
      }
    end

    dap.listeners.before['event_terminated']['easy-dotnet'] = function()
      debug_dll = nil
    end

    dap.adapters.coreclr = {
      type = 'executable',
      command = 'netcoredbg',
      args = { '--interpreter=vscode' },
    }

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
