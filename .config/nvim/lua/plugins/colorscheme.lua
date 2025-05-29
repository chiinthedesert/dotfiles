return {
  {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
      require("kanagawa").setup({
        compile = true,
      })
      -- vim.cmd("colorscheme kanagawa");
    end,
    build = function()
      vim.cmd("KanagawaCompile")
    end,
  },
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd("colorscheme solarized-osaka")
    end,
  },
}
