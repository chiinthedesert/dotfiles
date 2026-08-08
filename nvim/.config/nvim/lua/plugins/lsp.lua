return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = { "vim", "hl" },
            },
            workspace = {
              checkThirdParty = false,
              library = {
                vim.env.VIMRUNTIME,
                "/usr/share/hypr/stubs",
              },
            },
          },
        },
      })
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("html")
      vim.lsp.enable("cssls")
      vim.lsp.enable("ts_ls")
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    config = function()
      vim.lsp.config("jdtls", {
        root_dir = vim.fs.root(0, { "build.gradle", "settings.gradle", ".git", "gradlew" }),
        settings = {
          java = {
            -- Custom eclipse.jdt.ls options go here
          },
        },
      })
      vim.lsp.enable("jdtls")
    end,
  },
}
