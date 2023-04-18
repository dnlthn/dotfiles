local mappings = {}

for _, module in ipairs {
  "disable",
  "leader",
  "motions",
} do
  mappings = vim.tbl_deep_extend("force", mappings, require("user.mappings." .. module))
end

return mappings
