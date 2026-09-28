return {
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
    keys = {
      {
        "<leader>mt",
        function()
          require("markview.extras.checkboxes").toggler.init()
        end,
        desc = "toggle markdown task",
      },
    },
  },
}
