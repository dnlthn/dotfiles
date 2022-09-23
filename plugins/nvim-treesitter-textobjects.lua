return {
  config = function()
    local overrides = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          scope_incremental = "<CR>",
          node_incremental = "<TAB>",
          node_decremental = "<S-TAB>",
        },
      },
      textobjects = {
        -- select = {
        --   enable = false,
        --   keymaps = {
        --     ["f"] = { query = "@function.inner", desc = "function (treesitter)" },
        --     ["c"] = { query = "@class.inner", desc = "class (treesitter)" },
        --
        --     ["b"] = { query = "@block.inner", desc = "block (treesitter)" },
        --     ["ib"] = { query = "@block.inner", desc = "block (treesitter)" },
        --     ["ab"] = { query = "@block.outer", desc = "block (treesitter)" },
        --
        --     ["o"] = { query = "@conditional.inner", desc = "conditional (treesitter)" },
        --     ["ao"] = { query = "@conditional.outer", desc = "conditional (treesitter)" },
        --
        --     ["m"] = { query = "@comment.outer", desc = "comment (treesitter)" },
        --
        --     ["k"] = { query = "@keyword.inner", desc = "keyword (treesitter)" },
        --     ["ak"] = { query = "@keyword.outer", desc = "keyword (treesitter)" },
        --
        --     ["l"] = { query = "@loop.inner", desc = "loop (treesitter)" },
        --     ["al"] = { query = "@loop.outer", desc = "loop (treesitter)" },
        --
        --     ["r"] = { query = "@parameter.inner", desc = "parameter (treesitter)" },
        --     ["ar"] = { query = "@parameter.outer", desc = "parameter (treesitter)" },
        --
        --     ["v"] = { query = "@variable.inner", desc = "variable (treesitter)" },
        --     ["av"] = { query = "@variable.outer", desc = "variable (treesitter)" },
        --   },
        -- },
        swap = {
          enable = false,
        },
        move = {
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]c"] = "@class.outer",
            ["]b"] = "@block.outer",
            ["]o"] = "@conditional.outer",
            ["]m"] = "@comment.outer",
            ["]k"] = "@keyword.outer",
            ["]l"] = "@loop.outer",
            ["]r"] = "@parameter.outer",
            ["]v"] = "@variable.outer",
          },
          goto_next_end = {
            ["]F"] = "@function.outer",
            ["]C"] = "@class.outer",
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[c"] = "@class.outer",
          },
          goto_previous_end = {
            ["[F"] = "@function.outer",
            ["[C"] = "@class.outer",
          },
        },
        lsp_interop = {
          border = "single",
          peek_definition_code = {
            ["gp"] = "@function.outer",
            ["gP"] = "@class.outer",
          },
        },
      },
    }

    local defaults = {
      textobjects = {
        -- select = {
        --   enable = true,
        --
        --   -- Automatically jump forward to textobj, similar to targets.vim
        --   lookahead = true,
        --
        --   keymaps = {
        --     -- You can use the capture groups defined in textobjects.scm
        --     ["af"] = "@function.outer",
        --     ["if"] = "@function.inner",
        --     ["ac"] = "@class.outer",
        --     -- you can optionally set descriptions to the mappings (used in the desc parameter of nvim_buf_set_keymap
        --     ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        --   },
        --   -- You can choose the select mode (default is charwise 'v')
        --   selection_modes = {
        --     ["@parameter.outer"] = "v", -- charwise
        --     ["@function.outer"] = "V", -- linewise
        --     ["@class.outer"] = "<c-v>", -- blockwise
        --   },
        --   -- If you set this to `true` (default is `false`) then any textobject is
        --   -- extended to include preceding xor succeeding whitespace. Succeeding
        --   -- whitespace has priority in order to act similarly to eg the built-in
        --   -- `ap`.
        --   include_surrounding_whitespace = true,
        -- },
        swap = {
          enable = true,
          swap_next = {
            ["<leader>a"] = "@parameter.inner",
          },
          swap_previous = {
            ["<leader>A"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            ["]m"] = "@function.outer",
            ["]]"] = "@class.outer",
          },
          goto_next_end = {
            ["]M"] = "@function.outer",
            ["]["] = "@class.outer",
          },
          goto_previous_start = {
            ["[m"] = "@function.outer",
            ["[["] = "@class.outer",
          },
          goto_previous_end = {
            ["[M"] = "@function.outer",
            ["[]"] = "@class.outer",
          },
        },
        lsp_interop = {
          enable = true,
          border = "none",
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
    }

    require("nvim-treesitter.configs").setup(vim.tbl_deep_extend("force", defaults, overrides))
  end,
}
