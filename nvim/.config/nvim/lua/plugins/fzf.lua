return {
  {
    "ibhagwan/fzf-lua",
    dependencies = { { "nvim-mini/mini.icons", opts = {} } },

    opts = {
      ui_select = {},

      winopts = {
        border = "single",
        preview = { border = "single" },
      },

      files = {
        follow = true,
        hidden = true,
      },

      grep = {
        follow = true,
        hidden = true,
      },
    },

    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "find files" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "find buffers" },
      { "<leader>fl", "<cmd>FzfLua blines<cr>", desc = "current buffer lines" },
      { "<leader>fg", "<cmd>FzfLua grep_project<cr>", desc = "search all project lines" },
      { "<leader>fG", "<cmd>FzfLua live_grep_native<cr>", desc = "live grep current project" },

      -- git
      { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "git commits" },
      { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "git status / diff" },
      { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "git branches" },
      { "<leader>gB", "<cmd>FzfLua git_bcommits<cr>", desc = "git buffer commits" },

      -- lsp navigation
      { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "goto definition" },
      { "grr", "<cmd>FzfLua lsp_references<cr>", desc = "goto references" },
      { "gri", "<cmd>FzfLua lsp_implementations<cr>", desc = "goto implementation" },
      { "grt", "<cmd>FzfLua lsp_typedefs<cr>", desc = "goto type definition" },

      { "gO", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "document symbols" },
      { "<leader>ws", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", desc = "workspace symbols" },

      { "gra", "<cmd>FzfLua lsp_code_actions<cr>", mode = { "n", "v" }, desc = "code actions" },

      { "<leader>xd", "<cmd>FzfLua diagnostics_document<cr>", desc = "document diagnostics" },
      { "<leader>xD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "workspace diagnostics" },

      -- zoxide
      { "<leader>fz", "<cmd>FzfLua zoxide<cr>", desc = "list recent dirs" },
    },
  },
}
