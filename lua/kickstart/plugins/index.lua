return {
  'NMAC427/guess-indent.nvim', -- Detect tabstop and shiftwidth automatically
  require 'kickstart.plugins.which-key',
  require 'kickstart.plugins.telescope',

  -- LSP Plugins
  require 'kickstart.plugins.lazydev',
  require 'kickstart.plugins.nvim-lspconfig',

  -- Autoformat
  require 'kickstart.plugins.conform',
  -- Autocompletion
  require 'kickstart.plugins.blink',

  --  require 'kickstart.plugins.tokyonight',
  -- Highlight todo, notes, etc in comments
  require 'kickstart.plugins.todo-comments',

  -- Collection of various small independent plugins/modules
  require 'kickstart.plugins.mini',

  -- Highlight, edit, and navigate code
  require 'kickstart.plugins.nvim-treesitter',

  -- require 'kickstart.plugins.debug',
  -- require 'kickstart.plugins.indent_line',
  -- require 'kickstart.plugins.lint',

  -- Add closing character when starting new block (parenthesis)
  require 'kickstart.plugins.autopairs',
  require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

  --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  { import = 'custom.plugins' },

  -- For additional information with loading, sourcing and examples see `:help lazy.nvim-🔌-plugin-spec`
  -- Or use telescope!
  -- In normal mode type `<space>sh` then write `lazy.nvim-plugin`
  -- you can continue same window with `<space>sr` which resumes last telescope search
}
