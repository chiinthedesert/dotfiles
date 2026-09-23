return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    -- Completion for `blink.cmp`
    dependencies = { "saghen/blink.cmp" },
    opts = {
      latex = {
        enable = true, -- Master toggle for LaTeX
        blocks = {
          enable = true, -- Enable $$...$$ blocks
        },
        inlines = {
          enable = true, -- Enable $...$ inline math
        },
      },
      yaml = {
        properties = {
          enable = true,
          data_types = {
            ["text"] = {
              text = "",
              hl = "MarkviewIcon4",
            },
          },
        },
      },
    },
  },
}
