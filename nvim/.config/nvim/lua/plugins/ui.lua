return {
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.zenbones_darken_comments = 45
      vim.cmd.colorscheme("forestbones")
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        theme = "auto",
      },
      sections = {
        lualine_x = {
          {
            require("noice").api.status.command.get,
            cond = require("noice").api.status.command.has,
          },
          {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
          },
        },
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    opts = {
      level = vim.log.levels.WARN,

      on_open = function(win)
        local config = vim.api.nvim_win_get_config(win)
        config.border = "single"
        vim.api.nvim_win_set_config(win, config)
      end,
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      lsp = {
        signature = {
          auto_open = {
            enabled = false,
          },
        },
        progress = {
          enabled = false,
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "single",
          },
        },
        popupmenu = {
          border = {
            style = "single",
          },
        },
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
  },

  {
    "xiyaowong/transparent.nvim",
    enabled = false,
  },
}
