-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"
require "custom.go"
-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

--   hooks.add("setup_mappings", function(map)
--      local opts = { noremap=true, silent=true }
-- map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
-- .... many more mappings ....
--   end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

 hooks.add("install_plugins", function(use)
    use {
       "williamboman/nvim-lsp-installer",
    }

    use {
       "ray-x/go.nvim",
	}

	use {
	  "simeji/winresizer"
	}
	use {
	  "alvan/vim-closetag"
	}

	use {
	  "sheerun/vim-polyglot"
	}

 end)

-- let g:winresizer_start_key = '<C-w>r'
vim.g.winresizer_start_key = '<C-w>r'

-- require "custom.plugins.mkdir"
 hooks.add("setup_mappings", function(map)
    map("n", "<leader>vs", ":vsplit <CR>") -- example to delete the buffer
    map("n", "<leader>hs", ":split <CR>") -- example to delete the buffer
 end)



