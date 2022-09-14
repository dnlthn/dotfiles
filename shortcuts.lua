-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- LuaSnip Options
  luasnip = {
    -- Add paths for including more VS Code style snippets in luasnip
    vscode_snippet_paths = {},
    -- Extend filetypes
    filetype_extend = {
      javascript = { "javascriptreact" },
    },
  },

  -- Modify which-key registration (Use this with mappings table in the above.)
  mappings = {
    -- first key is the mode
    n = {
      ["sn"] = {
        function()
          require("syntax-tree-surfer").surf("normal", "next", true)
        end,
        desc = "swap next",
      },

      ["sp"] = {
        function()
          require("syntax-tree-surfer").surf("prev", "normal", true)
        end,
        desc = "swap previous",
      },

      ["sd"] = {
        function()
          require("syntax-tree-surfer").move("n", false)
        end,
        desc = "swap down",
      },

      ["su"] = {
        function()
          require("syntax-tree-surfer").move("n", true)
        end,
        desc = "swap up",
      },
      ["so"] = {
        function()
          require("syntax-tree-surfer").select()
        end,
        desc = "select outer",
      },
      ["si"] = {
        function()
          require("syntax-tree-surfer").select_current_node()
        end,
        desc = "select inner",
      },

      -- second key is the lefthand side of the map
      -- mappings seen under group name "Buffer"
      ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
      ["<leader>bc"] = {
        "<cmd>BufferLinePickClose<cr>",
        desc = "Pick to close",
      },
      ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
      ["<leader>bt"] = {
        "<cmd>BufferLineSortByTabs<cr>",
        desc = "Sort by tabs",
      },
      -- quick save
      -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    },
    t = {
      -- setting a mapping to false will disable it
      ["<esc>"] = false,
      ["jk"] = false,
    },
  },

  which_key = {
    -- Add bindings which show up as group name
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          ["b"] = { name = "Buffer" },
        },
      },
    },
  },
}
