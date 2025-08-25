return {
  {
    'williamboman/mason.nvim',
    opts = {
      ensure_installed = {
        'lua-language-server',
        'csharp-language-server',
        'omnisharp',
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
}
