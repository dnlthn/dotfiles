local _, cmp = pcall(require, "cmp")
local _, lspkind = pcall(require, "lspkind")
local compare = require "cmp.config.compare"

return {
  formatting = {
    fields = { "abbr", "kind", "menu" },
    format = lspkind.cmp_format {
      menu = {
        buffer = "(buffer)",
        nvim_lsp = "(lsp)",
        luasnip = "(luasnip)",
        nvim_lua = "(lua)",
        latex_symbols = "(latex)",
      },
  sorting = {
    comparators = {
      compare.locality,
      compare.recently_used,
      compare.score,
      compare.exact,
      compare.offset,
      -- compare.scopes,
      compare.kind,
      compare.sort_text,
      compare.length,
      compare.order,
    },
  },

  window = {
    completion = cmp.config.window.bordered {
      border = "single",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
    documentation = cmp.config.window.bordered {
      border = "single",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    },
  },
}
