return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
  },

  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "cssls", "html", "ts_ls" },
    })

    local on_attach = function(client, bufnr)
      local map = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end
        vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
      end

      -- Add your keymaps here. These are the most common and useful ones.
      map("gd", vim.lsp.buf.definition, "Go to Definition")
      map("gr", vim.lsp.buf.references, "Find All References")
      map("gD", vim.lsp.buf.declaration, "Go to Declaration")
      map("gI", vim.lsp.buf.implementation, "Go to Implementation")
      map("K", vim.lsp.buf.hover, "Hover Documentation")
      map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
      map("<leader>rn", vim.lsp.buf.rename, "Rename Symbol")

      -- Diagnostic keymaps
      map("[d", vim.diagnostic.goto_prev, "Go to Previous Diagnostic")
      map("]d", vim.diagnostic.goto_next, "Go to Next Diagnostic")
      map("<leader>e", vim.diagnostic.open_float, "Show Line Diagnostics")
    end

    local capabilities = require("blink.cmp").get_lsp_capabilities()

    vim.lsp.config("*", {
      on_attach = on_attach,
      capabilities = capabilities,
    })

    -- We can also add server-specific settings here.
    vim.lsp.config("lua_ls", {
      settings = {
        Lua = {
          diagnostics = { globals = { "vim" } },
        },
      },
    })

    vim.lsp.enable("lua_ls")
    vim.lsp.enable("cssls")
    vim.lsp.enable("html")
    vim.lsp.enable("tsserver")
  end,
}
