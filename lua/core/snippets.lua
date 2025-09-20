-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Function to install all mason packages
function MasonInstallAll()
  -- Initialize mason.nvim

  local ui = require 'mason.ui'
  ui.open()
  -- Load the list of Mason packages from the external file
  local mason_packages = require 'mason_packages'

  -- Check if mason-registry is loaded
  local mason_registry = require 'mason-registry'
  if not mason_registry then
    print 'Mason registry is not ready.'
    return
  end

  -- Create a list of packages that are not installed
  local packages_to_install = {}

  -- Find all packages that need to be installed
  for _, package in ipairs(mason_packages) do
    local pkg = mason_registry.get_package(package)
    if not pkg:is_installed() then
      table.insert(packages_to_install, package)
    end
  end

  -- If there are packages to install, show Mason UI with the installation progress
  if #packages_to_install > 0 then
    vim.defer_fn(function()
      mason_registry.refresh(function()
        for _, name in ipairs(mason_packages) do
          local ok, pkg = pcall(mason_registry.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end)
    end, 100) -- 100ms delay

    -- Confirm after installation
    print 'Mason packages installation complete!'
  else
    print 'All Mason packages are already installed.'
  end
end

-- Optional: Bind the function to a command in Neovim
vim.api.nvim_create_user_command('MasonInstallAll', MasonInstallAll, {})

-- Function to dump keymaps as Markdown
local function dump_keymaps_md(filepath)
  local modes = {
    n = 'Normal',
    i = 'Insert',
    v = 'Visual',
    x = 'Visual Block',
    s = 'Select',
    o = 'Operator-pending',
    t = 'Terminal',
    c = 'Command',
  }

  local lines = {}

  for mode, name in pairs(modes) do
    local maps = vim.api.nvim_get_keymap(mode)
    if #maps > 0 then
      table.insert(lines, '## ' .. name .. ' mode\n')
      table.insert(lines, '| Key | Action | Description |')
      table.insert(lines, '|-----|--------|-------------|')
      for _, map in ipairs(maps) do
        local lhs = map.lhs:gsub('|', '\\|')
        local rhs = (map.rhs or (map.callback and '<Lua callback>') or ''):gsub('|', '\\|')
        local desc = (map.desc or ''):gsub('|', '\\|')
        table.insert(lines, string.format('| `%s` | `%s` | %s |', lhs, rhs, desc))
      end
      table.insert(lines, '\n')
    end
  end

  if filepath then
    local f = io.open(filepath, 'w')
    if f then
      f:write(table.concat(lines, '\n'))
      f:close()
      print('Keymaps dumped to ' .. filepath)
    else
      print('Could not open file: ' .. filepath)
    end
  else
    -- Print to command output if no file is given
    print(table.concat(lines, '\n'))
  end
end

-- Create user command :DumpKeymapsMd [filepath]
vim.api.nvim_create_user_command('DumpKeymapsMd', function(opts)
  dump_keymaps_md(opts.args ~= '' and opts.args or nil)
end, { nargs = '?' })
