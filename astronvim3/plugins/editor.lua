return {
  {
    "axelvc/template-string.nvim",
    event = "User AstroFile",
    opts = {
      filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact", "python" }, -- filetypes where the plugin is active
      jsx_brackets = true,                                                                        -- must add brackets to jsx attributes
      remove_template_string = false,                                                             -- remove backticks when there are no template string
      restore_quotes = {
        -- quotes used when "remove_template_string" option is enabled
        normal = [[']],
        jsx = [["]],
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User AstroFile",
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "User AstroFile",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "zbirenbaum/copilot-cmp",
        dependencies = "copilot.lua",
        opts = {},
        config = function(_, opts)
          local copilot_cmp = require "copilot_cmp"
          copilot_cmp.setup(opts)
          -- attach cmp source whenever copilot attaches
          -- fixes lazy-loading issues with the copilot cmp source
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local on_attach = function(client)
                if client.name == "copilot" then copilot_cmp._on_insert_enter() end
              end

              local buffer = args.buf
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              on_attach(client, buffer)
            end,
          })
        end,
      },
    },
    opts = function(_, opts)
      local _, lspkind = pcall(require, "lspkind")
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local compare = cmp.config.compare
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end

      opts.formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          if entry.source.name == "cmp_tabnine" then
            vim_item.kind = " Tabnine"
            return vim_item
          elseif entry.source.name == "buffer" then
            vim_item.kind = "﬘ Buffer"
            return vim_item
          elseif entry.source.name == "copilot" then
            vim_item.kind = "  Copilot"
            return vim_item
          end

          return lspkind.cmp_format {
            -- menu = {
            --   cmp_tabnine = "(TabNine)",
            --   buffer = "(buffer)",
            --   nvim_lsp = "(lsp)",
            --   luasnip = "(luasnip)",
            --   nvim_lua = "(lua)",
            --   latex_symbols = "(latex)",
            -- },
          } (entry, vim_item)
        end,
      }
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          compare.exact,
          require("copilot_cmp.comparators").prioritize,
          compare.recently_used,
          compare.locality,
          compare.score,
          compare.offset,
          -- compare.scopes,
          compare.kind,
          compare.sort_text,
          compare.length,
          compare.order,
        },
      }

      opts.sources = cmp.config.sources {
        { name = "copilot",  priority = 1000 },
        { name = "nvim_lsp", priority = 900 },
        { name = "luasnip",  priority = 750 },
        { name = "path",     priority = 250 },
      }

      opts.window = {
        completion = cmp.config.window.bordered {
          border = "single",
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
        documentation = cmp.config.window.bordered {
          border = "single",
          winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
        },
      }

      if not opts.mapping then opts.mapping = {} end

      opts.mapping["<C-h>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.accept()
        else
          fallback()
        end
      end)

      opts.mapping["<C-d>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.next()
        else
          fallback()
        end
      end)

      opts.mapping["<C-u>"] = cmp.mapping(function(fallback)
        if copilot.is_visible() then
          copilot.prev()
        else
          fallback()
        end
      end)

      local confirm = opts.mapping["<CR>"]
      local confirm_copilot = cmp.mapping.confirm {
        select = true,
        behavior = cmp.ConfirmBehavior.Replace,
      }
      opts.mapping["<CR>"] = function(...)
        local entry = cmp.get_selected_entry()
        if entry and entry.source.name == "copilot" then return confirm_copilot(...) end
        return confirm(...)
      end

      return opts
    end,
  },
  {
    "Bryley/neoai.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
    },
    cmd = {
      "NeoAI",
      "NeoAIOpen",
      "NeoAIClose",
      "NeoAIToggle",
      "NeoAIContext",
      "NeoAIContextOpen",
      "NeoAIContextClose",
      "NeoAIInject",
      "NeoAIInjectCode",
      "NeoAIInjectContext",
      "NeoAIInjectContextCode",
    },
    keys = {
      { "<leader>ms", desc = "summarize text" },
      { "<leader>gm", desc = "Generate git message" },
    },
    config = function()
      require("neoai").setup {
        shortcuts = {
          {
            name = "textify",
            key = "<leader>ms",
            desc = "fix text with AI",
            use_context = true,
            prompt = [[
                Please rewrite the text to make it more readable, clear,
                concise, and fix any grammatical, punctuation, or spelling
                errors
            ]],
            modes = { "v" },
            strip_function = nil,
          },
          {
            name = "gitcommit",
            key = "<leader>gm",
            desc = "generate git commit message",
            use_context = false,
            prompt = function()
              return [[
                    Using the following git diff generate a concise and
                    clear git commit message. DO NOT include a body, just the title. It should follow semantic commits, start with a lowercase letter, have a non-capitalized verb as the first word following the semantic convention, and 75 characters or less:
                ]] .. vim.fn.system "git diff --cached"
            end,
            modes = { "n" },
            strip_function = nil,
          },
        },
      }
    end,
  },
}
