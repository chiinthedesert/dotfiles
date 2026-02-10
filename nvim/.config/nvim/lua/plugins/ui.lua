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
    "rose-pine/neovim",
    enabled = false,
    name = "rose-pine-moon",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {},
  },

  {
    "xiyaowong/transparent.nvim",
  },
}
