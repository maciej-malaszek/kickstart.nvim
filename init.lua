require 'core.options'
require 'core.snippets'
require 'core.keymaps'

-- Set up the Lazy plugin manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup {
  require 'plugins.colortheme',
  require 'plugins.alpha',
  require 'plugins.bufferline',
  require 'plugins.neotree',
  require 'plugins.which-key',
  require 'plugins.mason',
  require 'plugins.lualine',
  require 'plugins.treesitter',
  require 'plugins.telescope',
  require 'plugins.easy-dotnet',
  require 'plugins.blink',
  require 'plugins.lsp',
  require 'plugins.autoformatting',
  require 'plugins.gitsigns',
  require 'plugins.indent_blankline',
  require 'plugins.misc',
  require 'plugins.roslyn',
  require 'plugins.rust-tools',
  require 'plugins.debug',
  require 'plugins.trouble',
  require 'plugins.edgy',
  require 'plugins.toggleterm',
  require 'plugins.copilot',
  require 'plugins.sonarqube',
}
