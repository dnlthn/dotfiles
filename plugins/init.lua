return {
  ["max397574/better-escape.nvim"] = { disable = true },

  ["jose-elias-alvarez/typescript.nvim"] = require "user.plugins.typescript",
  ["mrshmllow/document-color.nvim"] = require "user.plugins.document-color",
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp_signature",
  ["phaazon/hop.nvim"] = require "user.plugins.hop",
  ["nacro90/numb.nvim"] = require "user.plugins.numb",
  ["nvim-treesitter/nvim-treesitter-context"] = require "user.plugins.nvim-treesitter-context",

  -- Simple configs
  { "folke/lua-dev.nvim" },
  { "B4mbus/oxocarbon-lua.nvim" },
  ["ziontee113/syntax-tree-surfer"] = { event = "BufRead" },
}
