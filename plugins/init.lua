return {
  ["max397574/better-escape.nvim"] = { disable = true },

  ["jose-elias-alvarez/typescript.nvim"] = require "user.plugins.typescript",
  ["mrshmllow/document-color.nvim"] = require "user.plugins.document-color",
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp_signature",
  ["phaazon/hop.nvim"] = require "user.plugins.hop",

  ["ziontee113/syntax-tree-surfer"] = { event = "BufRead" },

  -- Temporary type fixes
  -- { "folke/lua-dev.nvim" },
  ["ranjithshegde/lua-dev.nvim"] = { branch = "fix-types" },
}
