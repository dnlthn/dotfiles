return {
  ["max397574/better-escape.nvim"] = { disable = true },

  ["jose-elias-alvarez/typescript.nvim"] = require "user.plugins.typescript",
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp_signature",
  ["phaazon/hop.nvim"] = require "user.plugins.hop",
  ["nacro90/numb.nvim"] = require "user.plugins.numb",
  ["nvim-treesitter/nvim-treesitter-context"] = require "user.plugins.nvim-treesitter-context",
  ["nvim-treesitter/nvim-treesitter-textobjects"] = require "user.plugins.nvim-treesitter-textobjects",
  ["RRethy/nvim-treesitter-textsubjects"] = require "user.plugins.nvim-treesitter-textsubjects",
  ["tzachar/cmp-tabnine"] = require "user.plugins.cmp-tabnine",
  ["github/copilot.vim"] = require "user.plugins.copilot",
  ["beauwilliams/focus.nvim"] = require "user.plugins.focus",
  ["echasnovski/mini.nvim"] = {
    config = function() require("mini.ai").setup() end,
  },

  ["nvim-treesitter/playground"] = {
    config = function()
      require("nvim-treesitter.configs").setup {
        query_linter = {
          enable = true,
          use_virtual_text = true,
          lint_events = { "BufWrite", "CursorHold" },
        },
        playground = {
          enable = true,
          disable = {},
          updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
          persist_queries = false, -- Whether the query persists across vim sessions
          keybindings = {
            toggle_query_editor = "o",
            toggle_hl_groups = "i",
            toggle_injected_languages = "t",
            toggle_anonymous_nodes = "a",
            toggle_language_display = "I",
            focus_language = "f",
            unfocus_language = "F",
            update = "R",
            goto_node = "<cr>",
            show_help = "?",
          },
        },
      }
    end,
  },

  -- Simple configs
  { "folke/lua-dev.nvim" },
  { "B4mbus/oxocarbon-lua.nvim" },
  ["ziontee113/syntax-tree-surfer"] = { event = "BufRead" },
}
