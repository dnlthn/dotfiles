return {
  ["max397574/better-escape.nvim"] = { disable = true },

  ["jose-elias-alvarez/typescript.nvim"] = require "user.plugins.typescript",
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp_signature",
  ["phaazon/hop.nvim"] = require "user.plugins.hop",
  ["nacro90/numb.nvim"] = require "user.plugins.numb",
  ["nvim-treesitter/nvim-treesitter-context"] = require "user.plugins.nvim-treesitter-context",
  ["nvim-treesitter/nvim-treesitter-textobjects"] = require "user.plugins.nvim-treesitter-textobjects",
  ["RRethy/nvim-treesitter-textsubjects"] = require "user.plugins.nvim-treesitter-textsubjects",
  ["tzachar/cmp-tabnine"] = require "user.plugins.cmp-tabnine",
  ["github/copilot.vim"] = require "user.plugins.copilot",
  ["beauwilliams/focus.nvim"] = require "user.plugins.focus",

  -- Simple configs
  { "folke/lua-dev.nvim" },
  { "B4mbus/oxocarbon-lua.nvim" },
  ["ziontee113/syntax-tree-surfer"] = { event = "BufRead" },
}
