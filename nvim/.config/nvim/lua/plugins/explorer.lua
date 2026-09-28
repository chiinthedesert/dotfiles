return {
  {
    "stevearc/oil.nvim",
    opts = {
      delete_to_trash = true,
      skip_confirm_for_simple_edits = true,

      columns = {
        "icon",
        -- "permissions",
        "size",
        -- "mtime",
      },

      float = {
        max_width = 0.8,
        max_height = 0.8,
      },
      view_options = {
        show_hidden = true,
      },
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
      },
    },
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
      { "-", "<cmd>Oil --float<cr>", desc = "oil nvim" },
    },
  },
}
