-- Credit to @folke for rgb blends
-- https://github.com/folke/tokyonight.nvim/blob/8b55a47165348dd1d811f9e1f867bb17bb35a360/lua/tokyonight/util.lua#L10-L33
----@param c  string
local function hexToRgb(c)
	c = string.lower(c)
	return { tonumber(c:sub(2, 3), 16), tonumber(c:sub(4, 5), 16), tonumber(c:sub(6, 7), 16) }
end

---@param foreground string foreground color
---@param background string background color
---@param alpha number|string number between 0 and 1. 0 results in bg, 1 results in fg
local function blend(foreground, background, alpha)
	alpha = type(alpha) == "string" and (tonumber(alpha, 16) / 0xff) or alpha
	local bg = hexToRgb(background)
	local fg = hexToRgb(foreground)

	local blendChannel = function(i)
		local ret = (alpha * fg[i] + ((1 - alpha) * bg[i]))
		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
	end

	return string.format("#%02x%02x%02x", blendChannel(1), blendChannel(2), blendChannel(3))
end

local function darken(hex, amount, bg)
	return blend(hex, bg or "#161616", amount)
end

local colors = {
	bg = "#161616",
	cursor = "#202020",
	onyx = "#393939",
	comment = "#525252",
	lighter_comment = "#727272",
	turquoise = "#3ddbd9",
	pink = "#ee5396",
	green = "#42be65",
	purple = "#be95ff",
	error = "#db4b4b",
	warning = "#e0af68",
	info = "#0db9d7",
	hint = "#1abc9c",
}

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
	-- Telescope
	TelescopeSelection = { bg = colors.cursor },
	TelescopeMatching = { fg = colors.green, bold = true },
	TelescopeBorder = { fg = colors.onyx },
	TelescopeNormal = { bg = colors.bg },
	TelescopePromptBorder = { fg = colors.onyx },
	TelescopePromptNormal = { bg = colors.bg },
	TelescopePromptCounter = { fg = colors.comment },
	TelescopePromptTitle = { fg = colors.lighter_comment },
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
}
