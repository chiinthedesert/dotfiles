return {
  {
    "ellisonleao/gruvbox.nvim",
    enabled = true,
    priority = 1000,
    config = true,
    opts = ...,
    config = function()
      vim.cmd("colorscheme gruvbox")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {},
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
