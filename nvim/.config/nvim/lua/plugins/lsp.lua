vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/neovim/nvim-lspconfig",
})

require("mason").setup()

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
vim.lsp.enable("ty")
vim.lsp.enable("ruff")
vim.lsp.enable("clangd")
vim.lsp.enable({ "vue_ls", "tailwindcss", "vtsls", "cssls", "html" })
