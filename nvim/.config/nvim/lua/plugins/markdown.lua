return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    -- enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      win_options = {
        conceallevel = {
          rendered = 2,
        },
        concealcursor = {
          rendered = "",
        },
      },
    },
  },
}
