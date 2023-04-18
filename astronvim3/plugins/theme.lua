return {
  { "nyoom-engineering/oxocarbon.nvim" },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "HiPhish/nvim-ts-rainbow2",
      config = function()
        -- HACK: https://github.com/p00f/nvim-ts-rainbow/issues/112#issuecomment-1310835936
        vim.api.nvim_create_autocmd({ "BufWritePost", "FocusGained" }, {
          callback = function()
            vim.cmd "TSDisable rainbow"
            vim.cmd "TSEnable rainbow"
          end,
        })
      end,
    },
    opts = {
      rainbow = {
        enable = true,
        disable = { "jsx", "tsx" },
      },
    },
  },
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local fortune = require "alpha.fortune"

      local function button(sc, txt, keybind)
        local sc_ = sc:gsub("%s", ""):gsub("LDR", "<leader>")
        if vim.g.mapleader then
          sc = sc:gsub("LDR", vim.g.mapleader == " " and "SPC" or vim.g.mapleader)
        end

        return {
          type = "button",
          val = txt,
          on_press = function()
            local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
            vim.api.nvim_feedkeys(key, "normal", false)
          end,
          opts = {
            align_shortcut = "right",
            cursor = 5,
            hl = "DashboardCenter",
            hl_shortcut = "DashboardShortcut",
            keymap = { "n", sc_, keybind, { noremap = true, silent = true, nowait = true } },
            position = "center",
            shortcut = " " .. sc .. " ",
            width = 36,
          },
        }
      end

      opts.section.header.val = fortune()
      opts.section.buttons.val = {
        button("r", "  Recents", "<cmd> Telescope oldfiles <cr>"),
        button("f", "󰈞  Files", "<cmd> Telescope find_files <cr>"),
        button("w", "󱩾  Find Words", "<cmd> Telescope live_grep <cr>"),
        button("s", "  Last Session", "<cmd>SessionManager! load_last_session<cr>"),
        button("u", "  Update Plugins", "<cmd> Lazy update <cr>"),
        button("q", "  Quit", "<cmd> q <cr>"),
      }
    end,
  },
}
