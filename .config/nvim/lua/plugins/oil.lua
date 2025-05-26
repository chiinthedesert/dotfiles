return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for icons
  opts = {
    -- Skip confirmation for deleting a single file or directory,
    -- or creating a single directory.
    skip_confirm_for_simple_edits = true,

    -- Other options you might be interested in (defaults are usually good):
    delete_to_trash = true, -- true by default if trash utility is found
    -- view_options = {
    --   show_hidden = true, -- Set to true to show hidden files by default
    -- },
    -- columns = { "icon", "permissions", "size", "mtime" }, -- Default columns
  },
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
}
