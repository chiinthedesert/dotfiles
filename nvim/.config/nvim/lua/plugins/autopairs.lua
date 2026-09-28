return {
  -- automatically insert matching brackets and quotes
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      check_ts = true,
      map_cr = true,
      map_bs = true,
    },
  },

  -- automatically close and rename html tags
  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
    },
  },

  -- highlight and navigate matching delimiters
  {
    "andymass/vim-matchup",
    opts = {
      treesitter = {
        stopline = 500,
      },
    },
  },

  -- add, delete, and change surrounding pairs
  {
    "kylechui/nvim-surround",
    version = "^4.0.0",
    event = "VeryLazy",
    opts = {},
  },
}
