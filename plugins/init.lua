return {
  ["max397574/better-escape.nvim"] = { disable = true },

  ["jose-elias-alvarez/typescript.nvim"] = require "user.plugins.typescript",
  ["mrshmllow/document-color.nvim"] = require "user.plugins.document-color",
  ["ray-x/lsp_signature.nvim"] = require "user.plugins.lsp_signature",

  { "folke/lua-dev.nvim" },

  -- We also support a key value style plugin definition similar to NvChad:
  -- ["ray-x/lsp_signature.nvim"] = {
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
}
