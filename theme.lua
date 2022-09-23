return {
  -- colorscheme = "default_theme",
  colorscheme = "oxocarbon-lua",

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
      bufferline = false,
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
    ["oxocarbon-lua"] = function(hl)
      local colors = {
        bg = "#161616",
        cursor = "#262626",
        -- onyx = "#393939", -- 3
        comment = "#525252", -- 4
        -- "#dde1e6", -- 5
        -- light_grey = "#f2f4f8", -- 6
        -- "#ffffff", -- 7
        -- teal = "#08bdba", -- 8
        -- turquoise = "#3ddbd9",
        turquoise = "#3ddbd9",
        -- "#78a9ff", -- 10
        -- raspberry = "#ee5396", -- 11
        pink = "#ee5396", -- 11
        -- blue = "#33b1ff", -- 12
        -- pink = "#ff7eb6", -- 13
        green = "#42be65", -- 14
        purple = "#be95ff", -- 15
        -- sky_blue = "#82cfff",
        blue = "#82cfff",
        -- "#131313", -- 17
        -- "", -- 18
        -- "#a2a9b0", -- 19
        -- "#adadad", -- 20
      }

      local override_hl = {
        BufferLineFill = { bg = colors.bg },
        BufferLineTabClose = { fg = colors.blue, bg = colors.bg },

        BufferLineBufferSelected = { bold = true },
        BufferLineIndicatorSelected = { fg = colors.turquoise },

        FloatBorder = { fg = colors.cursor, bg = colors.bg },
        NormalFloat = { bg = colors.bg },
        CmpItemAbbrMatch = { fg = colors.pink, bold = true },

        TelescopeMatching = { fg = colors.pink, bold = true },
        TelescopeBorder = { fg = colors.cursor },
        TelescopePreviewBorder = { fg = colors.cursor },
        TelescopePromptBorder = { fg = colors.cursor },
        TelescopeResultsBorder = { fg = colors.cursor },

        NotifyInfoBorder = { fg = colors.cursor },

        HopNextKey = { fg = colors.bg, bg = colors.pink, bold = true },
        HopNextKey1 = { fg = colors.turquoise, bold = true },
        HopNextKey2 = { fg = colors.turquoise, bold = true },
        HopUnmatched = { fg = colors.comment, bg = colors.bg },

        LspReferenceRead = { bg = "none", underline = true },
        LspReferenceText = { bg = "none", underline = true },
        LspReferenceWrite = { bg = "none", underline = true },

        CopilotSuggestion = { fg = colors.comment, underline = true },
        CopilotAnnotation = { bg = "none", fg = colors.turquoise, bold = true },

        -- Shades built from comment
        -- Goal is for them "be in the background" but warn with colors when its too deep
        rainbowcol1 = { fg = colors.comment },
        rainbowcol2 = { fg = "#666666" },
        rainbowcol3 = { fg = "#7b7b7b" },
        rainbowcol4 = { fg = "#8f8f8f" },
        rainbowcol5 = { fg = colors.green },
        rainbowcol6 = { fg = colors.turquoise },
        rainbowcol7 = { fg = colors.pink },

        WhichKey = { fg = colors.purple, bold = true },
        WhichKeyGroup = { fg = colors.comment, bold = true },
        WhichKeyDesc = { fg = "#666666" },

        TSPunctDelimiter = { fg = colors.comment },
      }

      return vim.tbl_deep_extend("force", hl, override_hl)
    end,

    default_theme = function(hl) -- or a function that returns a new table of colors to set
      local C = require "default_theme.colors"
      C.buffer_visible_bg = "#1b1f26"

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

        BufferLinePick = { fg = C.red, bg = C.black },
        BufferLinePickSelected = { fg = C.red, bg = C.bg },
        BufferLinePickVisible = { fg = C.red, bg = C.buffer_visible_bg },
        BufferLineFill = { fg = C.grey_9, bg = C.bg },
        BufferLineBufferSelected = { fg = C.white, bg = C.bg, bold = true },
        BufferLineTabClose = { fg = C.red_4, bg = C.bg },
        BufferLineIndicatorSelected = { fg = C.red_4, bg = C.bg },
        BufferLineCloseButtonSelected = { fg = C.red_4, bg = C.bg },
        BufferLineModified = { fg = C.red_4, bg = C.black },
        BufferLineError = { fg = C.red_1, bg = C.red_1 },
        BufferLineErrorDiagnostic = { fg = C.red_1, bg = C.red_1 },
        BufferLineBackground = { fg = C.grey_9, bg = C.black },
        BufferLineTab = { fg = C.grey_9, bg = C.bg },
        BufferLineTabSelected = { fg = C.fg, bg = C.bg },
        BufferLineSeparator = { fg = C.bg, bg = C.black },
        BufferLineSeparatorVisible = { fg = C.bg, bg = C.buffer_visible_bg },
        BufferLineSeparatorSelected = { fg = C.grey_4, bg = C.bg },
        BufferLineCloseButton = { fg = C.grey_9, bg = C.black },
        BufferLineCloseButtonVisible = {
          fg = C.grey_10,
          bg = C.buffer_visible_bg,
        },
        BufferLineModifiedVisible = { fg = C.fg, bg = C.buffer_visible_bg },
        BufferLineModifiedSelected = { fg = C.green_2, bg = C.bg },

        LspReferenceRead = { bg = "none", underline = true },
        LspReferenceText = { bg = "none", underline = true },
        LspReferenceWrite = { bg = "none", underline = true },
      }

      return vim.tbl_deep_extend("force", hl, override_hl)
    end,
  },
}
