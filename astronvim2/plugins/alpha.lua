local fortune = require "alpha.fortune"

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("LDR", "<leader>")
  if vim.g.mapleader then
    sc = sc:gsub("LDR", vim.g.mapleader == " " and "SPC" or vim.g.mapleader)
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = {
      align_shortcut = "right",
      cursor = 5,
      hl = "DashboardHeader",
      hl_shortcut = "Folded",
      keymap = { "n", sc_, keybind, { noremap = true, silent = true, nowait = true } },
      position = "center",
      shortcut = " " .. sc .. " ",
      width = 40,
    },
  }
end

return {
  layout = {
    { type = "padding", val = vim.fn.max { 1, vim.fn.floor(vim.fn.winheight(0) * 0.1) } },
    {
      type = "text",
      val = fortune(),
      opts = {
        position = "center",
        hl = "Comment",
      },
    },
    { type = "padding", val = 2 },
    {
      type = "group",
      val = {
        button("r", "  Recents", "<cmd> Telescope oldfiles <cr>"),
        button("f", "  Find File", "<cmd> Telescope find_files <cr>"),
        button("w", "  Find Word", "<cmd> Telescope live_grep <cr>"),
        button("s", "  Last Session", "<cmd>SessionManager! load_last_session<cr>"),
        button("u", "  Update Plugins", "<cmd> PackerSync <cr>"),
        button("q", "  Quit", "<cmd> q <cr>"),
        -- harpoon
        -- projects
      },
      opts = { spacing = 1 },
    },
  },
}
