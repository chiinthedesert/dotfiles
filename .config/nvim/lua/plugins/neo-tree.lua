return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("neo-tree").setup({
      window = {
        width = 30,
        mappings = {
          ["<space>"] = "none", -- disable space toggling
        },
      },
      filesystem = {
        filtered_items = {
          visible = true, -- show dotfiles
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    })
    vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
  end,
}

