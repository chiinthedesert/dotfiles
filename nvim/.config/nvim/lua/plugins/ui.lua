return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = false,
    priority = 1000,
    opts = ...,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },
  {
    "p00f/alabaster.nvim",
    priority = 1000,
    config = function()
      vim.cmd("colorscheme alabaster")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "alabaster",
      },
    },
  },

  {
    "xiyaowong/transparent.nvim",
  },

  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
