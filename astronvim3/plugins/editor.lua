return {
  {
    "axelvc/template-string.nvim",
    event = "User AstroFile",
    opts = {
      filetypes = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'python' }, -- filetypes where the plugin is active
      jsx_brackets = true,                                                                        -- must add brackets to jsx attributes
      remove_template_string = false,                                                             -- remove backticks when there are no template string
      restore_quotes = {
        -- quotes used when "remove_template_string" option is enabled
        normal = [[']],
        jsx = [["]],
      },
    }
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "User AstroFile",
    config = true,
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "User AstroFile",
    opts = { suggestion = { enabled = false }, panel = { enabled = false } },
  },

  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function() require("copilot_cmp").setup() end,
    lazy = false,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "zbirenbaum/copilot.lua" },
    opts = function(_, opts)
      local _, lspkind = pcall(require, "lspkind")
      local cmp, copilot = require "cmp", require "copilot.suggestion"
      local compare = cmp.config.compare
      local snip_status_ok, luasnip = pcall(require, "luasnip")
      if not snip_status_ok then return end
      local function has_words_before()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
            and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s"
            == nil
      end

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
      opts.mapping["<CR>"] = cmp.mapping.confirm({
        -- this is the important line
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
      })

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

      return opts
    end,
  },
}
