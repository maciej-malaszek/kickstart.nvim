return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000, -- load before other UI plugins
  opts = {
    flavour = 'macchiato', -- latte, frappe, macchiato, mocha
    transparent_background = true,
    auto_integrations = true,
    term_colors = true,
    dim_inactive = {
      enabled = false,
      shade = 'dark',
      percentage = 0.15,
    },
    color_overrides = {
      macchiato = {
        base = '#1e1e2e',
        mantle = '#181825',
        crust = '#11111b',
        diamond = '#a3e8f2', -- ✨ custom accent (icy cyan/diamond)
      },
    },

    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      mini = true,
      which_key = true,
    },
    custom_highlights = function(colors)
      return {
        -- Softer comments
        Comment = { fg = colors.overlay1, style = { 'italic' } },

        -- Sapphire blue keywords
        Keyword = { fg = colors.sapphire, style = { 'bold' } },

        -- Functions in bright diamond accent
        Function = { fg = colors.diamond, style = { 'bold' } },

        -- Strings in teal
        String = { fg = colors.teal },

        -- Constants in mauve
        Constant = { fg = colors.mauve },

        -- Types in diamond to stand out
        Type = { fg = colors.diamond, style = { 'italic' } },
      }
    end,
  },
  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme 'catppuccin'
  end,
}
