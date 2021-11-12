
local M = {}

M.setup_lsp = function(attach, capabilities)
   local lsp_installer = require "nvim-lsp-installer"

   lsp_installer.on_server_ready(function(server)
      local opts = {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 200,
         },
         settings = {},
      }
      if server.name == "tsserver" then
        opts.settings = {
          typescript = {
            compilerOptions = {
              target = "es6",
              module = "es6",
              moduleResolution = "node",
              sourceMap = true,
              declaration = true,
              noEmitOnError = true,
              experimentalDecorators = true,
              emitDecoratorMetadata = true,
              experimentalAsyncFunctions = true,
              jsx = "react",
              allowJs = true,
              allowSyntheticDefaultImports = true,
              allowUnreachableCode = true,
              allowUnusedLabels = true,
              noImplicitReturns = true
           },
           javascript = {
             module = "module",
             allowSyntheticDefaultImports = true,
             allowUnreachableCode = true,
             allowUnusedLabels = true,
             noImplicitReturns = true
           }
        }
     }
      end

      server:setup(opts)
      vim.cmd [[ do User LspAttachBuffers ]]
   end)
end

return M
