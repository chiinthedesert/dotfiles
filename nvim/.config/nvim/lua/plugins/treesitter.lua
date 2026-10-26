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
      -- Disable built-in ftplugin mappings to prevent filetype conflicts
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
      -- SELECT TEXTOBJECTS --

      -- Functions (#let blocks / definitions)
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

      -- Math blocks ($ ... $)
      {
        "am",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@math.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around math block",
      },
      {
        "im",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@math.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside math block",
      },

      -- Headings (= Title line only)
      {
        "ah",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@heading.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around heading line",
      },
      {
        "ih",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@heading.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside heading title",
      },

      -- Sections (Full section container)
      {
        "as",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@section.outer", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "around section container",
      },
      {
        "is",
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@section.inner", "textobjects")
        end,
        mode = { "x", "o" },
        desc = "inside section content",
      },

      -- Arguments / Parameters
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

      -- MOVEMENT --

      -- Functions
      {
        "]f",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "next function",
      },
      {
        "[f",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "previous function",
      },

      -- Math expressions ($ ... $)
      {
        "]m",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@math.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "next math block",
      },
      {
        "[m",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@math.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "previous math block",
      },

      -- Headings
      {
        "]h",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@heading.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "next heading line",
      },
      {
        "[h",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@heading.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "previous heading line",
      },

      -- Sections
      {
        "]s",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@section.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "next section block",
      },
      {
        "[s",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@section.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "previous section block",
      },

      -- Code / Raw blocks
      {
        "]c",
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@code.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "next code block",
      },
      {
        "[c",
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@code.outer", "textobjects")
        end,
        mode = { "n", "x", "o" },
        desc = "previous code block",
      },

      -- SWAP --

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
