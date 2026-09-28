return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    lazy = false,
    dependencies = { "nvim-treesitter/nvim-treesitter" },

    init = function()
      -- disable built-in ftplugin mappings to avoid conflicts
      vim.g.no_plugin_maps = true
    end,

    opts = {
      select = {
        lookahead = true,
        selection_modes = {
          ["@parameter.outer"] = "v",
          ["@function.outer"] = "V",
        },
        include_surrounding_whitespace = false,
      },
      move = {
        set_jumps = true,
      },
    },

    config = function(_, opts)
      require("nvim-treesitter-textobjects").setup(opts)
    end,

    keys = {
      -- functions
      {
        "af",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around function",
      },
      {
        "if",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside function",
      },

      -- classes
      {
        "ac",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around class",
      },
      {
        "ic",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside class",
      },

      -- parameters
      {
        "aa",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around argument",
      },
      {
        "ia",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside argument",
      },

      -- conditionals
      {
        "ai",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around conditional",
      },
      {
        "ii",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside conditional",
      },

      -- loops
      {
        "al",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around loop",
      },
      {
        "il",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside loop",
      },

      -- local scope
      {
        "aS",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals")
        end,
        mode = { "x", "o" },
        desc = "around local scope",
      },

      -- function movement
      {
        "]m",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "next function",
      },
      {
        "[m",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "previous function",
      },

      -- class movement
      {
        "]]",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "next class",
      },
      {
        "[[",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "previous class",
      },

      -- swap parameters
      {
        "<leader>sn",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next("@parameter.inner")
        end,
        desc = "swap next argument",
      },
      {
        "<leader>sp",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@parameter.inner")
        end,
        desc = "swap previous argument",
      },
    },
  },
}
