return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
  },
  keys = {
    { "<leader>ff", function() require('fzf-lua').files() end, desc = "Find files in current working dir" },
    { "<leader>fg", function() require('fzf-lua').live_grep() end, desc = "Find by grepping in current working dir" },
    { "<leader>fb", function() require('fzf-lua').buffers() end, desc = "Find buffers (fzf)" },
    { "<leader>fk", function() require('fzf-lua').keymaps() end, desc = "Search keymaps (fzf)" },
  }
}
