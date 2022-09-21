return {
  n = {
    ["sn"] = {
      function() require("syntax-tree-surfer").surf("normal", "next", true) end,
      desc = "swap next",
    },

    ["sp"] = {
      function() require("syntax-tree-surfer").surf("prev", "normal", true) end,
      desc = "swap previous",
    },

    ["sd"] = {
      function() require("syntax-tree-surfer").move("n", false) end,
      desc = "swap down",
    },

    ["su"] = {
      function() require("syntax-tree-surfer").move("n", true) end,
      desc = "swap up",
    },
    ["so"] = {
      function() require("syntax-tree-surfer").select() end,
      desc = "select outer",
    },
    ["si"] = {
      function() require("syntax-tree-surfer").select_current_node() end,
      desc = "select inner",
    },
  },

  v = {
    ["h"] = {
      function() require("syntax-tree-surfer").surf("parent", "visual") end,
    },
    ["j"] = {
      function() require("syntax-tree-surfer").surf("next", "visual") end,
    },
    ["k"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual") end,
    },
    ["l"] = {
      function() require("syntax-tree-surfer").surf("child", "visual") end,
    },

    ["<A-j>"] = {
      function() require("syntax-tree-surfer").surf("next", "visual", true) end,
    },
    ["<A-k>"] = {
      function() require("syntax-tree-surfer").surf("prev", "visual", true) end,
    },
  },
}
