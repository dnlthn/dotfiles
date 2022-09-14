local _, cmp = pcall(require, "cmp")
local _, lspkind = pcall(require, "lspkind")

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
