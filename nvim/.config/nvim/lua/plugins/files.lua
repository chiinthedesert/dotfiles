return {
  -- Oil
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for icons
    lazy = false,
    opts = {
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
        natural_order = true,
        is_always_hidden = function(name, _)
          return name == ".." or name == ".git"
        end,
      },
      win_options = {
        wrap = true,
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
      float = {
        -- Padding around the floating window
        padding = 2,
        -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = 0.5,
        max_height = 0.5,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
    },
    keys = {
      { "-", "<cmd>Oil --float<CR>", desc = "Open parent dir" },
    },
  },

  -- Fzflua
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {},
    keys = {
      { "<leader>ff", function() require("fzf-lua").files() end,   desc = "Find files" },
      { "<leader>fg", function() require("fzf-lua").live_grep() end, desc = "Live grep" },
      { "<leader>fb", function() require("fzf-lua").buffers() end, desc = "List buffers" },
      { "<leader>fk", function() require("fzf-lua").keymaps() end, desc = "Show keymaps" },
    },
  },

  -- Harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
      },
    },
    keys = {
      { "<leader>a", function() require("harpoon"):list():add() end, desc = "Harpoon add" },
      { "<C-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Harpoon menu" },

      { "<leader>@", function() require("harpoon"):list():select(1) end, desc = "Harpoon 1" },
      { "<leader>[", function() require("harpoon"):list():select(2) end, desc = "Harpoon 2" },
      { "<leader>{", function() require("harpoon"):list():select(3) end, desc = "Harpoon 3" },
      { "<leader>(", function() require("harpoon"):list():select(4) end, desc = "Harpoon 4" },
    }
  },

}
