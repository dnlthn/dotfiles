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
  -- ["github/copilot.vim"] = require "user.plugins.copilot",
  ["beauwilliams/focus.nvim"] = require "user.plugins.focus",
  -- ["zbirenbaum/copilot-cmp"] = {
  --   after = { "copilot.lua" },
  --   config = function() require("copilot_cmp").setup()
  --
  --     astronvim.add_cmp_source { name = "copilot", priority = 1000, max_item_count = 2 }
  --   end,
  -- },
  ["zbirenbaum/copilot.lua"] = {
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup {
        panel = {
          enabled = true,
          auto_refresh = true,
          keymap = {
            jump_prev = "[[",
            jump_next = "]]",
            accept = "<CR>",
            refresh = "gr",
            open = "<M-CR>",
          },
        },
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 75,
          keymap = {
            accept = "<M-l>",
            accept_word = false,
            accept_line = false,
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
          },
        },
        filetypes = {
          yaml = false,
          markdown = false,
          help = false,
          gitcommit = false,
          gitrebase = false,
          hgcommit = false,
          svn = false,
          cvs = false,
          ["."] = false,
        },
        copilot_node_command = "node", -- Node.js version must be > 16.x
        server_opts_overrides = {},
      }
    end,
  },
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

  -- ChatGPT
  ["jackMort/ChatGPT.nvim"] = {
    config = function()
      require("chatgpt").setup {
        -- welcome_message = WELCOME_MESSAGE, -- set to "" if you don't like the fancy godot robot
        loading_text = "loading",
        question_sign = "", -- you can use emoji if you want e.g. 🙂
        answer_sign = "ﮧ", -- 🤖
        max_line_length = 120,
        yank_register = "+",
        chat_layout = {
          relative = "editor",
          position = "50%",
          size = {
            height = "80%",
            width = "80%",
          },
        },
        settings_window = {
          border = {
            style = "rounded",
            text = {
              top = " Settings ",
            },
          },
        },
        chat_window = {
          filetype = "chatgpt",
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top = " ChatGPT ",
            },
          },
        },
        chat_input = {
          prompt = "  ",
          border = {
            highlight = "FloatBorder",
            style = "rounded",
            text = {
              top_align = "center",
              top = " Prompt ",
            },
          },
        },
        openai_params = {
          model = "text-chat-davinci-002-20221122",
          frequency_penalty = 0,
          presence_penalty = 0,
          max_tokens = 300,
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        openai_edit_params = {
          model = "text-chat-davinci-002-20221122",
          temperature = 0,
          top_p = 1,
          n = 1,
        },
        keymaps = {
          close = { "<C-c>", "<Esc>" },
          yank_last = "<C-y>",
          scroll_up = "<C-u>",
          scroll_down = "<C-d>",
          toggle_settings = "<C-o>",
          new_session = "<C-n>",
          cycle_windows = "<Tab>",
        },
      }
    end,
    requires = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
  },

  -- Simple configs
  -- { "folke/lua-dev.nvim" },
  ["folke/neodev.nvim"] = { config = function() require("neodev").setup() end },
  { "B4mbus/oxocarbon-lua.nvim" },
  ["ziontee113/syntax-tree-surfer"] = { event = "BufRead" },
}
