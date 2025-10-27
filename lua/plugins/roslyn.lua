return {
  'seblyng/roslyn.nvim',
  ft = { 'cs', 'vb', 'razor', 'fs' },
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {
    -- "auto" | "roslyn" | "off"
    --
    -- - "auto": Does nothing for filewatching, leaving everything as default
    -- - "roslyn": Turns off neovim filewatching which will make roslyn do the filewatching
    -- - "off": Hack to turn off all filewatching. (Can be used if you notice performance issues)
    filewatching = 'auto',

    -- Optional function that takes an array of targets as the only argument. Return the target you
    -- want to use. If it returns `nil`, then it falls back to guessing the target like normal
    -- Example:
    --
    -- choose_target = function(target)
    --     return vim.iter(target):find(function(item)
    --         if string.match(item, "Foo.sln") then
    --             return item
    --         end
    --     end)
    -- end
    choose_target = nil,

    -- Optional function that takes the selected target as the only argument.
    -- Returns a boolean of whether it should be ignored to attach to or not
    --
    -- I am for example using this to disable a solution with a lot of .NET Framework code on mac
    -- Example:
    --
    -- ignore_target = function(target)
    --     return string.match(target, "Foo.sln") ~= nil
    -- end
    ignore_target = nil,

    -- Whether or not to look for solution files in the child of the (root).
    -- Set this to true if you have some projects that are not a child of the
    -- directory with the solution file
    broad_search = false,

    -- Whether or not to lock the solution target after the first attach.
    -- This will always attach to the target in `vim.g.roslyn_nvim_selected_solution`.
    -- NOTE: You can use `:Roslyn target` to change the target
    lock_target = false,

    -- If the plugin should silence notifications about initialization
    silent = false, -- your configuration comes here; leave empty for default settings
  },
  dependencies = {
    {
      -- By loading as a dependencies, we ensure that we are available to set
      -- the handlers for Roslyn.
      'tris203/rzls.nvim',
      config = true,
    },
  },
  lazy = false,
  config = function()
    -- Use one of the methods in the Integration section to compose the command.
    local mason_registry = require 'mason-registry'

    local rzls_path = vim.fn.expand '$MASON/packages/rzls/libexec'
    local cmd = {
      'roslyn',
      '--stdio',
      '--logLevel=Information',
      '--extensionLogDirectory=' .. vim.fs.dirname(vim.lsp.get_log_path()),
      '--razorSourceGenerator=' .. vim.fs.joinpath(rzls_path, 'Microsoft.CodeAnalysis.Razor.Compiler.dll'),
      '--razorDesignTimePath=' .. vim.fs.joinpath(rzls_path, 'Targets', 'Microsoft.NET.Sdk.Razor.DesignTime.targets'),
      '--extension',
      vim.fs.joinpath(rzls_path, 'RazorExtension', 'Microsoft.VisualStudioCode.RazorExtension.dll'),
    }

    vim.lsp.config('roslyn', {
      cmd = cmd,
      handlers = require 'rzls.roslyn_handlers',
      settings = {
        ['csharp|completion'] = {
          dotnet_show_completion_items_from_unimported_namespaces = true,
          dotnet_show_name_completion_suggestions = true,
          dotnet_provide_regex_completions = true,
        },
        ['csharp|inlay_hints'] = {
          csharp_enable_inlay_hints_for_implicit_object_creation = true,
          csharp_enable_inlay_hints_for_implicit_variable_types = true,

          csharp_enable_inlay_hints_for_lambda_parameter_types = true,
          csharp_enable_inlay_hints_for_types = true,
          dotnet_enable_inlay_hints_for_indexer_parameters = true,
          dotnet_enable_inlay_hints_for_literal_parameters = true,
          dotnet_enable_inlay_hints_for_object_creation_parameters = true,
          dotnet_enable_inlay_hints_for_other_parameters = true,
          dotnet_enable_inlay_hints_for_parameters = true,
          dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
          dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
        },
        ['csharp|code_lens'] = {
          dotnet_enable_references_code_lens = true,
        },
      },
    })
    vim.lsp.enable 'roslyn'
  end,
  init = function()
    -- We add the Razor file types before the plugin loads.
    vim.filetype.add {
      extension = {
        razor = 'razor',
        cshtml = 'razor',
      },
    }
  end,
}
