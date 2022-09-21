local mappings = {}

for _, module in ipairs {
  "base",
  "bufferline",
  "hop",
  "syntax-tree-surfer",
  "telescope",
  "copilot",
} do
  mappings = vim.tbl_deep_extend("force", mappings, require("mappings." .. module))
end

return mappings
