return {
  -- CMP Source Priorities
  -- modify here the priorities of default cmp sources
  -- higher value == higher priority
  -- The value can also be set to a boolean for disabling default sources:
  -- false == disabled
  -- true == 1000
  cmp = {
    source_priority = {
      nvim_lsp = 900,
      luasnip = 750,
      path = 250,
      buffer = false,
    },
  },

  lsp_config = {
    skip_setup = {
      "tsserver",
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
    -- easily add or disable built in mappings added during LSP attaching
    mappings = {
      n = {
        -- ["<leader>lf"] = false -- disable formatting keymap
        ["gr"] = false,
      },
    },
    -- add to the global LSP on_attach function
    -- on_attach = function(client, bufnr) end,

    -- override the mason server-registration function
    server_registration = function(server, opts)
      if server == "sumneko_lua" then
        opts = vim.tbl_deep_extend("force", opts, require("lua-dev").setup())
      end

      require("lspconfig")[server].setup(opts)
    end,

    capabilities = {
      textDocument = {
        colorProvider = {
          dynamicRegistration = true,
        },
      },
    },

    -- Add overrides for LSP server settings, the keys are the name of the server
    ["server-settings"] = {
      -- example for addings schemas to yamlls
      -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
      --   settings = {
      --     yaml = {
      --       schemas = {
      --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
      --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
      --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
      --       },
      --     },
      --   },
      -- },
      -- Example disabling formatting for a specific language server
      -- gopls = { -- override table for require("lspconfig").gopls.setup({...})
      --   on_attach = function(client, bufnr)
      --     client.resolved_capabilities.document_formatting = false
      --   end
      -- }
    },
  },
}
