local function map(cmd, desc)
  return {
    cmd,
    desc = desc,
    silent = true,
    expr = true,
    script = true,
  }
end

return {
  i = {
    ["<C-h>"] = map("copilot#Accept(<Tab>)", "Accept copilot suggestion"),
    ["<C-p>"] = map("copilot#Previous()", "Previous copilot suggestion"),
    ["<C-n>"] = map("copilot#Next()", "Next copilot suggestion"),
    ["<C-\\>"] = { "<Cmd>vertical Copilot panel<CR>", desc = "Copilot suggestions" },
  },
  n = {
    ["<leader>c"] = { "<Cmd>vertical Copilot panel<CR>", desc = "Copilot suggestions" },
  },
}
