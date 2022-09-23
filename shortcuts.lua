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

  -- Goal bindings
  -- b = buffer
  -- f = find
  -- g = git
  --
  -- add:
  -- <space><space> = either harpoon or find_files or open_buffers
  -- t = toggle for UI stuff quickly
  -- p = zoxide projects
  -- hjkl = window navigation freeing up ctrl+hjkl to move edit around
  --
  -- changes
  -- l -> c = code
  -- s -> h = help and remove git branches
  -- / -> / = telescope search file or project?
  -- c -> c+c = nest copilot in code
  -- t -> T = terminal is not really used since i cant fish
  -- p -> P = packer not used as much so move to uppercase
  --
  --
  -- remove
  -- o
  -- h -> bake clear highlight into esc
  -- v -> surf
  -- d -> prefix to peek somehow
  --
  -- maybes:
  -- o -> telescope file open?
  -- f -> telescope grep
  -- if using f to grep then move rest to s for search
  --
  which_key = {
    -- Add bindings which show up as group name
    register_mappings = {
      -- first key is the mode, n == normal mode
      n = {
        -- second key is the prefix, <leader> prefixes
        ["<leader>"] = {
          -- third key is the key to bring up next level and its displayed
          -- group name in which-key top level menu
          b = { name = " buffer" },
          f = { name = " find" },
          g = { name = " git" },
          l = { name = " code" },
          S = { name = " session" },
          t = { name = " terminal" },
          p = { name = " packer" },
          s = { name = " search" },
        },
      },
    },
  },
}
