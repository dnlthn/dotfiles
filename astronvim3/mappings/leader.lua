local leader = "<leader>"

local function with_leader(arr)
  local result = {}

  for mode, keybindings in pairs(arr) do
    result[mode] = {}

    for key, value in pairs(keybindings) do
      local new_key = leader .. key
      result[mode][new_key] = value
    end
  end

  return result
end

return with_leader {
  n = {
    ["`"] = { "<cmd> :e# <cr>", desc = "󰮳  Last buffer" },
    ["."] = {
      function() require("telescope.builtin").find_files() end,
      desc = "  Find files",
    },
    ["/"] = {
      function() require("telescope.builtin").live_grep() end,
      desc = "Search project",
    },
    ["<tab>"] = {
      function()
        require("telescope.builtin").buffers(require("telescope.themes").get_dropdown {
          prompt_prefix = require("astronvim.utils").get_icon "Search",
          previewer = false,
          initial_mode = "normal",
          path_display = { "smart" },
          show_all_buffers = true,
          attach_mappings = function(_, map)
            map(
              "n",
              "c",
              function(prompt_bufnr) require("telescope.actions").delete_buffer(prompt_bufnr) end
            )
            return true
          end,
        })
      end,
      desc = "󰓩  Last buffer",
    },
    ["a"] = {
      function() require("harpoon.mark").add_file() end,
      desc = "󰛢  Harpoon",
    },
    ["<space>"] = {
      function() require("harpoon.ui").toggle_quick_menu() end,
      desc = "󰛢  Swap harpoons",
    },
    ["fh"] = { "<cmd> Telescope harpoon marks <cr>", desc = "󰛢  Find harpoons" },
  },
}
