return {
  -- Colorscheme
  {
    "folke/tokyonight.nvim",
    enabled = false,
    lazy = true,
    priority = 1000,
    opts = {
      style = "moon", -- "storm", "night", "moon", or "day"
      transparent = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd("colorscheme tokyonight")
    end
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function ()
      vim.cmd("colorscheme solarized-osaka")
    end

  },

  -- Statusline
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      theme = "solarized-osaka",
    },
  },


  -- Snacks
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      image = { enabled = true },
      dashboard = { enabled = true },
      bufdelete = { enabled = true },
    },
  },
}
