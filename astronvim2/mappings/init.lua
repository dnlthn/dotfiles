local mappings = {}

for _, module in ipairs {
  "base",
  "bufferline",
  "hop",
  -- "syntax-tree-surfer",
  "telescope",
  -- "copilot",
  "focus",
} do
  mappings = vim.tbl_deep_extend("force", mappings, require("user.mappings." .. module))
end

return mappings
