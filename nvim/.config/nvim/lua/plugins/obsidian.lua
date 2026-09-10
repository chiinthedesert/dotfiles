return {
  "obsidian-nvim/obsidian.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "ibhagwan/fzf-lua" },
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    picker = {
      name = "fzf-lua",
    },
    workspaces = {
      {
        name = "chi_obsidian",
        path = "~/Documents/obsidian/chi_obsidian",
      },
    },
  },
}
