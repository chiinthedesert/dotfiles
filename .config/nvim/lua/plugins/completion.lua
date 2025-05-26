-- ~/.config/nvim/lua/plugins/completion.lua
return {
  -- Snippet Engine: LuaSnip
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest major version found on <https://github.com/L3MON4D3/LuaSnip/releases>
    -- build = "make install_jsregexp", -- For regular expression matching in snippets, if you need it, install with make
    dependencies = {
      -- Collection of snippets
      "rafamadriz/friendly-snippets",
    },
    config = function()
      -- Tell LuaSnip to load snippets from friendly-snippets
      -- This line assumes friendly-snippets are in VSCode format.
      require("luasnip.loaders.from_vscode").lazy_load()

      -- You can configure LuaSnip further here if needed, e.g., custom snippets:
      -- require("luasnip").filetype_extend("markdown", {
      --   require("luasnip.extras.markdown").markdown_converters()
      -- })
      -- require("luasnip").add_snippets("all", {
      --   luasnip.parser.parse_snippet("test", "this is a test snippet"),
      -- })

      -- Optional: print a message to confirm LuaSnip loaded
      -- print("LuaSnip and friendly-snippets configured!")
    end,
    -- LuaSnip doesn't need a specific event if nvim-cmp depends on it correctly
    -- or if its functions are called by nvim-cmp.
    -- We can also set it to load very lazily or on InsertEnter if preferred.
    lazy = false, -- Let's make sure snippets are available early. Or use an event.
  },

  -- Autocompletion Engine: nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter", -- Load nvim-cmp when you enter insert mode
    dependencies = {
      -- Sources for nvim-cmp:
      "hrsh7th/cmp-buffer",   -- Completions from words in your current buffer
      "hrsh7th/cmp-path",     -- Completions for file system paths
      "saadparwaiz1/cmp_luasnip", -- Bridge for LuaSnip to work with nvim-cmp

      -- We will add "hrsh7th/cmp-nvim-lsp" back here later when you want LSP completions
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip") -- Required for <Tab> and <S-Tab> snippet jumping

      cmp.setup({
        snippet = {
          -- REQUIRED for LuaSnip integration
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Despite the name, this is the function LuaSnip provides for nvim-cmp
          end,
        },

        -- Key Mappings for the completion menu
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation back
          ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll documentation forward
          ['<C-Space>'] = cmp.mapping.complete(),    -- Manually trigger completion
          ['<C-e>'] = cmp.mapping.abort(),         -- Close completion menu
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selection (Enter key)

          -- Tab completion and snippet navigation
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- If completion menu is visible, select next item
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- If in a snippet and can jump, jump forward
            else
              fallback() -- Otherwise, do the default Tab action
            end
          end, { "i", "s" }), -- "i" for insert mode, "s" for select mode (snippet active)

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- If completion menu is visible, select previous item
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) -- If in a snippet and can jump, jump backward
            else
              fallback() -- Otherwise, do the default Shift-Tab action
            end
          end, { "i", "s" }),
        }),

        -- Completion Sources (Order matters: higher in the list means higher priority)
        sources = cmp.config.sources({
          { name = "luasnip" }, -- Snippets (from LuaSnip)
          { name = "buffer" },  -- Words from the current buffer
          { name = "path" },    -- File system paths
          -- { name = "nvim_lsp" }, -- We'll add this back when you set up LSP completions
        }),

        -- Optional: You can customize the appearance of the completion window
        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },
      })

      -- Optional: print a message to confirm nvim-cmp loaded
      -- print("nvim-cmp (non-LSP setup) configured!")
    end,
  },
}
