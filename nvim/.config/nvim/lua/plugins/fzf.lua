return {
  {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-mini/mini.icons" },
    ---@module "fzf-lua"
    ---@type fzf-lua.Config|{}
    ---@diagnostic disable: missing-fields

    opts = {
      ui_select = {},
      winopts = {
        border = "single",
        preview = { border = "single" },
      },
      fzf_opts = {
        ["--no-literal"] = true,
      },
    },
    ---@diagnostic enable: missing-fields
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "find files" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "find buffers" },
      { "<leader>fg", "<cmd>FzfLua grep_project<cr>", desc = "search all project lines" },
      { "<leader>fG", "<cmd>FzfLua live_grep_native<cr>", desc = "live grep current project" },

      { "<leader>fd", "<cmd>FzfLua diagnostics_document<cr>", desc = "document diagnostics" },
      { "<leader>fD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "workspace diagnostics" },
      { "<leader>ca", "<cmd>FzfLua lsp_code_actions<cr>", desc = "code actions" },

      { "<leader>gc", "<cmd>FzfLua git_commits<cr>", desc = "git commits" },
      { "<leader>gs", "<cmd>FzfLua git_status<cr>", desc = "git status / diff" },
      { "<leader>gb", "<cmd>FzfLua git_branches<cr>", desc = "git branches" },
      { "<leader>gB", "<cmd>FzfLua git_bcommits<cr>", desc = "git buffer commits" },

      { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "goto definition" },
      { "gr", "<cmd>FzfLua lsp_references<cr>", desc = "goto references" },
      { "gI", "<cmd>FzfLua lsp_implementations<cr>", desc = "goto implementation" },
      { "gy", "<cmd>FzfLua lsp_typedefs<cr>", desc = "goto type definition" },
    },
  },
}
