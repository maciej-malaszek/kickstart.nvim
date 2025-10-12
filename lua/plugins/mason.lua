return {
  {
    'mason-org/mason.nvim',
    opts = {
      registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
      ensure_installed = {
        'lua-language-server',
        -- 'csharp-language-server',
        -- 'omnisharp',
        'xmlformatter',
        'stylua',
        'bicep-lsp',
        'html-lsp',
        'css-lsp',
        'csharpier',
        'prettier',
        'json-lsp',
      },
    },
  },
  'mason-org/mason-lspconfig.nvim',
  'WhoIsSethDaniel/mason-tool-installer.nvim',
}
