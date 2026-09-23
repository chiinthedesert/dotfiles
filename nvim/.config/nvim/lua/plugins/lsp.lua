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
      local vue_plugin_path = vim.fn.stdpath("data")
        .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
      vim.lsp.config("vtsls", {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" },
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                {
                  name = "@vue/typescript-plugin",
                  location = vue_plugin_path,
                  languages = { "vue" },
                  configNamespace = "typescript",
                  enableForWorkspaceTypeScriptVersions = true,
                },
              },
            },
          },
        },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("basedpyright")
      vim.lsp.enable("clangd")
      vim.lsp.enable("tombi")
      vim.lsp.enable({ "vue_ls", "tailwindcss", "vtsls", "cssls", "html" })
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
