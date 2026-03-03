return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
    keys = {
      {
        "<leader>qs",
        function()
          require("persistence").load()
        end,
        desc = "load the session for current dir",
      },
      {
        "<leader>qS",
        function()
          require("persistence").select()
        end,
        desc = "select a session",
      },
      {
        "<leader>qS",
        function()
          require("persistence").load({ last = true })
        end,
        desc = "load the last session",
      },
      {
        "<leader>qd",
        function()
          require("persistence").stop()
        end,
        desc = "stop persistence",
      },
    },
  },

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "buffer local keymaps (which-key)",
      },
    },
  },
}
