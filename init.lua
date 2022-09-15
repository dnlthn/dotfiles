local config = {
  updater = require("user.astro").updater,

  diagnostics = require("user.vim").diagnostics,
  options = require("user.vim").options,
  polish = require("user.vim").polish,

  colorscheme = require("user.theme").colorscheme,
  default_theme = require("user.theme").default_theme,
  highlights = require("user.theme").highlights,

  cmp = require("user.lsp").cmp,
  lsp = require("user.lsp").lsp_config,

  ["which-key"] = require("user.shortcuts").which_key,
  luasnip = require("user.shortcuts").luasnip,
  mappings = require("user.shortcuts").mappings,
}

return config
