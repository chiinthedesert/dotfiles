return {
  "stevearc/oil.nvim",
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for icons
  opts = {
    default_file_explorer = true,
    skip_confirm_for_simple_edits = true,
    delete_to_trash = true,
    view_options = {
      show_hidden = true,
      natural_order = true,
      is_always_hidden = function (name, _)
        return name == '..' or name == '.git'
      end,
    },
    win_options = {
      wrap = true
    },
    -- columns = { "icon", "permissions", "size", "mtime" }, -- Default columns
    keymaps = {
      ["g?"] = { "actions.show_help", mode = "n" },
      ["<CR>"] = "actions.select",
      ["<leader>\\"] = { "actions.select", opts = { vertical = true } },
      ["<leader>-"] = { "actions.select", opts = { horizontal = true } },
      ["<C-t>"] = { "actions.select", opts = { tab = true } },
      ["<C-p>"] = "actions.preview",
      ["<C-c>"] = { "actions.close", mode = "n" },
      ["<C-l>"] = "actions.refresh",
      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },
      ["`"] = { "actions.cd", mode = "n" },
      ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
      ["gs"] = { "actions.change_sort", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,

  vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open parent dir in oil", noremap = true, silent = true }),
}
