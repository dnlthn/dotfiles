local colors = require "user.colors.oxocarbon"
local darken = require("user.colors.utils").darken

return {
  -- WhichKey
  WhichKey = { fg = colors.purple },
  WhichKeyGroup = { fg = colors.hint },
  WhichKeyDesc = { fg = colors.comment },
  -- Notify borders
  NotifyERRORBorder = { fg = colors.error },
  NotifyERRORTitle = { fg = colors.error },
  NotifyERRORIcon = { fg = colors.error },
  NotifyWARNBorder = { fg = colors.warning },
  NotifyWARNTitle = { fg = colors.warning },
  NotifyWARNIcon = { fg = colors.warning },
  NotifyINFOBorder = { fg = colors.info },
  NotifyINFOTitle = { fg = colors.info },
  NotifyINFOIcon = { fg = colors.info },
  NotifyDEBUGBorder = { fg = colors.hint },
  NotifyDEBUGTitle = { fg = colors.hint },
  NotifyDEBUGIcon = { fg = colors.hint },
  -- LSP Virtual Text
  DiagnosticError = { fg = colors.error },
  DiagnosticWarn = { fg = colors.warning },
  DiagnosticInfo = { fg = colors.info },
  DiagnosticHint = { fg = colors.hint },
  DiagnosticVirtualTextError = { bg = darken(colors.error, 0.1), fg = colors.error },
  DiagnosticVirtualTextWarn = { bg = darken(colors.warning, 0.1), fg = colors.warning },
  DiagnosticVirtualTextInfo = { bg = darken(colors.info, 0.1), fg = colors.info },
  DiagnosticVirtualTextHint = { bg = darken(colors.hint, 0.1), fg = colors.hint },
  DiagnosticUnderlineError = { undercurl = true, sp = colors.error },
  DiagnosticUnderlineWarn = { undercurl = true, sp = colors.warning },
  DiagnosticUnderlineInfo = { undercurl = true, sp = colors.info },
  DiagnosticUnderlineHint = { undercurl = true, sp = colors.hint },
  -- Underline word under cursor
  LspReferenceRead = { bg = "none", underline = true },
  LspReferenceText = { bg = "none", underline = true },
  LspReferenceWrite = { bg = "none", underline = true },
  -- Consistent search coloring
  CmpItemAbbrMatch = { fg = colors.green, bold = true },
  IncSearch = { bg = colors.green, fg = colors.bg },
  Search = { bg = darken(colors.green, 0.1), fg = colors.green },
  -- Leap
  LeapMatch = { bg = darken(colors.green, 0.1), fg = colors.green },
  LeapLabelPrimary = { bg = darken(colors.green, 0.1), fg = colors.green },
  LeapLabelSecondary = { bg = darken(colors.pink, 0.1), fg = colors.pink },
  -- Clean visual noise from background color offsets
  HarpoonBorder = { fg = colors.onyx },
  FloatTitle = { fg = colors.pink },
  FoldColumn = { fg = colors.purple },
  CursorLineNr = { fg = colors.turquoise },
  FloatBorder = { fg = colors.onyx, bg = colors.bg },
  NormalFloat = { bg = colors.bg },
  CursorLine = { bg = colors.bg },
  NeoTreeCursorLine = { bg = colors.cursor },
  Visual = { bg = colors.cursor },
  CopilotSuggestion = { fg = colors.lighter_comment, underline = true },
  CopilotAnnotation = { bg = "none", fg = colors.turquoise, bold = true },
  -- Dim the delimitters
  ["@punctuation.delimiter"] = { fg = colors.lighter_comment },
  TSRainbowRed = { fg = colors.comment },
  TSRainbowYellow = { fg = "#666666" },
  TSRainbowBlue = { fg = "#7b7b7b" },
  TSRainbowOrange = { fg = "#8f8f8f" },
  TSRainbowGreen = { fg = colors.green },
  TSRainbowViolet = { fg = colors.turquoise },
  TSRainbowCyan = { fg = colors.pink },
  -- Telescope
  TelescopeSelection = { bg = colors.cursor },
  TelescopeMatching = { fg = colors.green, bold = true },
  TelescopeBorder = { fg = colors.onyx },
  TelescopeNormal = { bg = colors.bg },
  TelescopePromptBorder = { fg = colors.onyx },
  TelescopePromptNormal = { bg = colors.bg },
  TelescopePromptCounter = { fg = colors.comment },
  TelescopePromptTitle = { fg = colors.lighter_comment },
  TelescopePromptPrefix = { fg = colors.onyx, bg = "none" },
  TelescopePreviewTitle = { fg = colors.lighter_comment },
  -- Semantic Tokens
  ["@lsp.type.comment"] = { link = "@comment" },
  ["@lsp.type.enum"] = { link = "@type" },
  ["@lsp.type.interface"] = { link = "Identifier" },
  ["@lsp.type.keyword"] = { link = "@keyword" },
  ["@lsp.type.namespace"] = { link = "@namespace" },
  ["@lsp.type.parameter"] = { link = "@parameter" },
  ["@lsp.type.property"] = { link = "@property" },
  ["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
  ["@lsp.type.function"] = { link = "@function" },
  ["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
  ["@lsp.typemod.operator.injected"] = { link = "@operator" },
  ["@lsp.typemod.string.injected"] = { link = "@string" },
  ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
  ["@lsp.typemod.variable.injected"] = { link = "@variable" },
  -- Dashboard
  DashboardHeader = { fg = colors.comment },
  DashboardCenter = { fg = colors.turquoise },
  DashboardShortcut = { fg = colors.comment, bg = "#262626" },
  DashboardFooter = { fg = colors.comment },
  -- Context
  TreesitterContext = { bg = colors.cursor },
  IndentBlanklineChar = { fg = colors.cursor },
  IndentBlanklineContextChar = { fg = colors.turquoise },
  NeotreeFloatBorder = { fg = colors.turquoise, bg = colors.bg },
  -- Cmp Menu
  CmpItemKindCopilot = { fg = colors.green, bg = "none" },
  CmpItemKindKeyword = { fg = colors.turquoise, bg = "none" },
  CmpItemKindVariable = { fg = colors.purple, bg = "none" },
  CmpItemKindConstant = { fg = colors.purple, bg = "none" },
  CmpItemKindReference = { fg = colors.purple, bg = "none" },
  CmpItemKindValue = { fg = colors.purple, bg = "none" },
  CmpItemKindFunction = { fg = colors.hint, bg = "none" },
  CmpItemKindMethod = { fg = colors.hint, bg = "none" },
  CmpItemKindConstructor = { fg = colors.hint, bg = "none" },
  CmpItemKindClass = { fg = colors.warning, bg = "none" },
  CmpItemKindEnum = { fg = colors.warning, bg = "none" },
  CmpItemKindEvent = { fg = colors.warning, bg = "none" },
  CmpItemKindInterface = { fg = colors.warning, bg = "none" },
  CmpItemKindStruct = { fg = colors.warning, bg = "none" },
  CmpItemKindUnit = { fg = colors.warning, bg = "none" },
  CmpItemKindModule = { fg = colors.pink, bg = "none" },
  CmpItemKindEnumMember = { fg = colors.green, bg = "none" },
  CmpItemKindField = { fg = colors.green, bg = "none" },
  CmpItemKindOperator = { fg = colors.green, bg = "none" },
  CmpItemKindProperty = { fg = colors.green, bg = "none" },
  CmpItemKindTypeParameter = { fg = colors.green, bg = "none" },
  CmpItemKindSnippet = { fg = colors.lighter_comment, bg = "none" },
  CmpItemKindText = { fg = colors.turquoise, bg = "none" },
  CmpItemKindFile = { fg = colors.purple, bg = "none" },
  CmpItemKindFolder = { fg = colors.green, bg = "none" },
  CmpItemKindColor = { fg = colors.turquoise, bg = "none" },
  -- Heirline Colors used in AstroNvim
  HeirlineInactive = { bg = colors.onyx },
  HeirlineNormal = { bg = colors.pink },
  HeirlineInsert = { bg = colors.green },
  HeirlineVisual = { bg = colors.purple },
  HeirlineReplace = { bg = colors.turquoise },
  HeirlineCommand = { bg = colors.warning },
  HeirlineTerminal = { bg = colors.green },
  WinBar = { fg = colors.lighter_comment, bg = colors.bg },
  WinBarNC = { fg = colors.comment, bg = colors.bg },
  GitSignsAdd = { fg = colors.green },
  GitSignsChange = { fg = colors.warning },
  GitSignsDelete = { fg = colors.pink },
  GlanceWinBarTitle = { fg = colors.purple },
  GlanceListCount = { fg = colors.pink },
}
