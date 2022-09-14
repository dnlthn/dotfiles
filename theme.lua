return {
  colorscheme = "default_theme",

  default_theme = {
    -- set the highlight style for diagnostic messages
    diagnostics_style = { italic = true },
    -- Modify the color palette for the default theme
    colors = {
      fg = "#abb2bf",
      bg = "#1e222a",
    },
    -- enable or disable highlighting for extra plugins
    plugins = {
      aerial = true,
      beacon = false,
      bufferline = true,
      dashboard = true,
      highlighturl = true,
      hop = false,
      indent_blankline = true,
      lightspeed = false,
      ["neo-tree"] = true,
      notify = true,
      ["nvim-tree"] = false,
      ["nvim-web-devicons"] = true,
      rainbow = true,
      symbols_outline = false,
      telescope = true,
      vimwiki = false,
      ["which-key"] = true,
    },
  },

  -- Override highlight groups in any theme
  highlights = {
    -- duskfox = { -- a table of overrides/changes to the default
    --   Normal = { bg = "#000000" },
    -- },
    default_theme = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"

      local override_hl = {
        TelescopeBorder = { fg = C.grey_4, bg = C.bg },
        TelescopeNormal = { bg = C.bg },
        TelescopePreviewBorder = { fg = C.grey_4, bg = C.bg },
        TelescopePreviewNormal = { bg = C.bg },
        TelescopePreviewTitle = { fg = C.bg, bg = C.green },
        TelescopePromptBorder = { fg = C.grey_4, bg = C.bg },
        TelescopePromptNormal = { fg = C.fg, bg = C.bg },
        TelescopePromptPrefix = { fg = C.red, bg = C.bg },
        TelescopePromptTitle = { fg = C.bg, bg = C.red },
        TelescopeResultsBorder = { fg = C.grey_4, bg = C.bg },
        TelescopeResultsNormal = { bg = C.bg },
        TelescopeResultsTitle = { fg = C.bg, bg = C.grey_4 },

        FloatBorder = { fg = C.grey_4 },
        NormalFloat = { bg = C.bg },

        CmpItemAbbrMatch = { fg = C.blue, bold = true }, -- Highlight matching letters
        CmpItemKindKeyword = { fg = C.cyan, bg = C.none },
        CmpItemKindVariable = { fg = C.purple, bg = C.none },
        CmpItemKindConstant = { fg = C.purple, bg = C.none },
        CmpItemKindReference = { fg = C.purple, bg = C.none },
        CmpItemKindValue = { fg = C.purple, bg = C.none },
        CmpItemKindFunction = { fg = C.blue, bg = C.none },
        CmpItemKindMethod = { fg = C.blue, bg = C.none },
        CmpItemKindConstructor = { fg = C.blue, bg = C.none },
        CmpItemKindClass = { fg = C.orange_1, bg = C.none },
        CmpItemKindEnum = { fg = C.orange_1, bg = C.none },
        CmpItemKindEvent = { fg = C.orange_1, bg = C.none },
        CmpItemKindInterface = { fg = C.orange_1, bg = C.none },
        CmpItemKindStruct = { fg = C.orange_1, bg = C.none },
        CmpItemKindUnit = { fg = C.orange_1, bg = C.none },
        CmpItemKindModule = { fg = C.yellow, bg = C.none },
        CmpItemKindEnumMember = { fg = C.green, bg = C.none },
        CmpItemKindField = { fg = C.green, bg = C.none },
        CmpItemKindOperator = { fg = C.green, bg = C.none },
        CmpItemKindProperty = { fg = C.green, bg = C.none },
        CmpItemKindTypeParameter = { fg = C.green, bg = C.none },
        CmpItemKindSnippet = { fg = C.gray_5, bg = C.none },
      }

      return vim.tbl_deep_extend("force", hl, override_hl)
    end,
  },

  header = {
    "███    ██ ██    ██ ██ ███    ███",
    "████   ██ ██    ██ ██ ████  ████",
    "██ ██  ██ ██    ██ ██ ██ ████ ██",
    "██  ██ ██  ██  ██  ██ ██  ██  ██",
    "██   ████   ████   ██ ██      ██",
  },
}
