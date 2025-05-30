return {
  -- Snippet Engine: LuaSnip
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Pin to the latest v2 major release for stability
    build = "make install_jsregexp", -- Uncomment if you need JS-like regex in snippets
    dependencies = {
      "rafamadriz/friendly-snippets", -- A collection of useful snippets
    },
    config = function()
      -- Load snippets from friendly-snippets (VSCode format)
      require("luasnip.loaders.from_vscode").lazy_load()

      -- Example for adding custom snippets for a specific filetype:
      -- require("luasnip").filetype_extend("lua", { paths = "~/.config/nvim/lua/custom_snippets/lua" })
    end,
    lazy = false, -- Load LuaSnip relatively early so snippets are available
  },

  -- Autocompletion Engine: nvim-cmp
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      -- Source for LSP completions (uncomment when your LSP setup is ready)
      "hrsh7th/cmp-nvim-lsp",
      "saadparwaiz1/cmp_luasnip", -- Source for snippets from LuaSnip
      "hrsh7th/cmp-buffer",   -- Source for text from the current buffer
      "hrsh7th/cmp-path",     -- Source for file system paths
      "hrsh7th/cmp-cmdline",  -- Source for command-line (:) and search (/) completions
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip") -- Required for Tab/S-Tab snippet navigation

      -- Setup nvim-cmp for INSERT MODE
      cmp.setup({
        snippet = {
          -- Configure how nvim-cmp expands snippets
          expand = function(args)
            luasnip.lsp_expand(args.body) -- Use LuaSnip to expand snippets
          end,
        },

        -- Key mappings for the completion menu in insert mode
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- Scroll documentation window up
          ['<C-f>'] = cmp.mapping.scroll_docs(4),  -- Scroll documentation window down
          ['<C-Space>'] = cmp.mapping.complete(),    -- Manually trigger completion menu
          ['<C-e>'] = cmp.mapping.abort(),         -- Close completion menu
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Confirm selected completion

          -- Use Tab and Shift-Tab to navigate completion items and snippet placeholders
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item() -- Select next item in completion menu
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump() -- Jump to next placeholder in an active snippet
            else
              fallback() -- Default Tab behavior
            end
          end, { "i", "s" }), -- "i" for insert mode, "s" for snippet select mode

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item() -- Select previous item in completion menu
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1) -- Jump to previous placeholder in an active snippet
            else
              fallback() -- Default Shift-Tab behavior
            end
          end, { "i", "s" }),
        }),

        -- Completion sources for INSERT MODE (order defines priority)
        sources = cmp.config.sources({
          { name = "nvim_lsp" }, -- Uncomment when LSP is configured and cmp-nvim-lsp is a dependency
          { name = "luasnip" }, -- Suggest snippets
          { name = "buffer" },  -- Suggest words from the current buffer
          { name = "path" },    -- Suggest file system paths
        }),

        -- Optional: Add borders to completion and documentation windows
        -- window = {
        --   completion = cmp.config.window.bordered({ border = "solid" }),
        --   documentation = cmp.config.window.bordered({ border = "solid" }),
        -- },
      })

      -- Setup nvim-cmp for COMMAND-LINE MODE (after typing ':')
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(), -- Default keymappings for cmdline completion
        sources = cmp.config.sources({
          { name = "path" },     -- Suggest file system paths
        }, {
          { name = "cmdline" }, -- Suggest Ex commands and their arguments
        })
      })

      -- Setup nvim-cmp for SEARCH MODE (after typing '/' or '?')
      cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(), -- Default keymappings for cmdline completion
        sources = {
          { name = "buffer" }, -- Suggest words from the current buffer for search terms
        }
      })
    end,
  },
}
