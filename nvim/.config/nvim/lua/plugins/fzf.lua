vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua",
})

require("fzf-lua").setup({
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
})

-- files and search
vim.keymap.set("n", "<leader>ff", "<cmd>FzfLua files<cr>", { desc = "find files" })
vim.keymap.set("n", "<leader>fb", "<cmd>FzfLua buffers<cr>", { desc = "find buffers" })
vim.keymap.set("n", "<leader>fl", "<cmd>FzfLua blines<cr>", { desc = "current buffer lines" })
vim.keymap.set("n", "<leader>fg", "<cmd>FzfLua grep_project<cr>", { desc = "search project lines" })
vim.keymap.set("n", "<leader>fG", "<cmd>FzfLua live_grep_native<cr>", { desc = "live grep project" })

-- git
vim.keymap.set("n", "<leader>gc", "<cmd>FzfLua git_commits<cr>", { desc = "git commits" })
vim.keymap.set("n", "<leader>gs", "<cmd>FzfLua git_status<cr>", { desc = "git status / diff" })
vim.keymap.set("n", "<leader>gb", "<cmd>FzfLua git_branches<cr>", { desc = "git branches" })
vim.keymap.set("n", "<leader>gB", "<cmd>FzfLua git_bcommits<cr>", { desc = "git buffer commits" })

-- lsp navigation
vim.keymap.set("n", "gd", "<cmd>FzfLua lsp_definitions<cr>", { desc = "goto definition" })
vim.keymap.set("n", "grr", "<cmd>FzfLua lsp_references<cr>", { desc = "goto references" })
vim.keymap.set("n", "gri", "<cmd>FzfLua lsp_implementations<cr>", { desc = "goto implementation" })
vim.keymap.set("n", "grt", "<cmd>FzfLua lsp_typedefs<cr>", { desc = "goto type definition" })
vim.keymap.set("n", "gO", "<cmd>FzfLua lsp_document_symbols<cr>", { desc = "document symbols" })
vim.keymap.set("n", "<leader>ws", "<cmd>FzfLua lsp_live_workspace_symbols<cr>", { desc = "workspace symbols" })
vim.keymap.set({ "n", "v" }, "gra", "<cmd>FzfLua lsp_code_actions<cr>", { desc = "code actions" })
vim.keymap.set("n", "<leader>xd", "<cmd>FzfLua diagnostics_document<cr>", { desc = "document diagnostics" })
vim.keymap.set("n", "<leader>xD", "<cmd>FzfLua diagnostics_workspace<cr>", { desc = "workspace diagnostics" })

-- zoxide
vim.keymap.set("n", "<leader>fz", "<cmd>FzfLua zoxide<cr>", { desc = "recent directories" })
