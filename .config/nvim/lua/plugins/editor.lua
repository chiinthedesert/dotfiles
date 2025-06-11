return {
  -- Comment
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
  },

  -- Dummy text
  {
    "derektata/lorem.nvim",
    config = function()
      require("lorem").opts({
        sentence_length = "medium",
        comma_chance = 0.2,
        max_commas = 2,
      })
    end,
  },

  -- Persistence
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- Load early enough for session restoration
    opts = {
      options = { "buffers", "curdir", "tabpages", "winsize", "winpos", "help", "folds", "globals", "localoptions" },
      save_empty = false,
    },
    keys = {
      { "<leader>ss", function() require("persistence").save() end, desc = "Session: Save for CWD",},
      { "<leader>sl", function() require("persistence").load() end, desc = "Session: Load last for CWD",},
      { "<leader>sL", function() require("persistence").select() end, desc = "Session: Select",},
    },
  },

  -- Undotree
  {
    "mbbill/undotree",
    keys = {
      { "<leader><F5>", "<cmd>UndotreeToggle<CR>", desc = "Undotree" },
    },
    cmd = "UndotreeToggle"
  }
}
