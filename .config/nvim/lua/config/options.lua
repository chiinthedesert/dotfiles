-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt -- Local variable for conciseness
local g = vim.g   -- Local variable for global settings

--  paroiAppearance
opt.termguicolors = true -- Enable 24-bit RGB colors, essential for modern themes
opt.number = true        -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers for easier vertical navigation
opt.cursorline = true    -- Highlight the current line
opt.signcolumn = "yes"   -- Always show the signcolumn to prevent text jitter (reserves 1-2 columns)
opt.wrap = false         -- Disable line wrapping (preferred for code)

-- Show invisible characters (tabs, trailing spaces, non-breaking spaces)
opt.list = true
opt.listchars = {
  tab = "▸ ", -- Character for tab
  trail = "·", -- Character for trailing whitespace
  nbsp = "+",  -- Character for non-breaking space
  -- lead = "·", -- Character for leading whitespace (optional)
  -- eol = "󰌑", -- Character for end of line (optional, requires Nerd Font)
  extends = '»',
  precedes = '«',
}
opt.fillchars = { eob = " " } -- Hide the `~` symbols on blank lines at the end of a buffer

-- Behavior
opt.mouse = "a"             -- Enable mouse support in all modes (normal, visual, insert, command)
opt.clipboard = "unnamedplus" -- Use the system clipboard for all yank/paste operations
opt.hidden = true           -- Allow buffers to be hidden without saving (important for multi-file workflows)
opt.confirm = true          -- Ask for confirmation for actions like :q on a modified buffer

-- Text Editing & Indentation
opt.tabstop = 2        -- Number of visual spaces per tab character
opt.softtabstop = 2    -- Number of spaces for editing operations (Tab, Backspace)
                       -- Set to -1 to follow shiftwidth: opt.softtabstop = -1
opt.shiftwidth = 2     -- Number of spaces to use for auto-indentation
opt.expandtab = true   -- Use spaces instead of tab characters
opt.autoindent = true  -- Copy indent from current line when starting a new line
opt.smartindent = true -- Enable smarter indentation for C-like languages (Tree-sitter indent often supersedes this)
opt.breakindent = true -- Indented lines will wrap with the same indentation

opt.showmode = false   -- Disable showing mode in command line (usually handled by statusline)

-- Searching
opt.ignorecase = true  -- Ignore case when searching
opt.smartcase = true   -- Override ignorecase if the search pattern contains uppercase letters
opt.hlsearch = true    -- Highlight all search matches
opt.incsearch = true   -- Show search results incrementally as you type
opt.gdefault = true    -- Make :s/.../.../ act like :s/.../.../g by default (for current line)

-- Performance & UI Responsiveness
opt.scrolloff = 8        -- Keep at least 8 lines visible above and below the cursor
opt.sidescrolloff = 8    -- Keep at least 8 columns visible to the left and right of the cursor
opt.updatetime = 250     -- Time in milliseconds for CursorHold event (used by plugins like git-signs, LSP)
opt.timeoutlen = 500     -- Time in milliseconds to wait for a mapped sequence to complete (default 1000)
                         -- Consider ttimeoutlen if you use <Esc> for mode changes quickly:
                         -- opt.timeout = true
                         -- opt.ttimeoutlen = 10

opt.completeopt = "menuone,noselect,noinsert" -- Autocompletion options for nvim-cmp:
                                              -- menuone: show menu even if only one match
                                              -- noselect: don't automatically select the first match
                                              -- noinsert: don't automatically insert the first match

-- Files & Backup
opt.swapfile = false     -- Disable swap files (using persistent undo instead)
opt.backup = false       -- Disable backup files
opt.undofile = true      -- Enable persistent undo (Neovim will store undo history in a file)
                         -- You can set undodir if you want, e.g.:
                         -- local undodir = vim.fn.stdpath("data") .. "/undodir"
                         -- if vim.fn.isdirectory(undodir) == 0 then vim.fn.mkdir(undodir, "p") end
                         -- opt.undodir = undodir

opt.autoread = true      -- Automatically re-read files if changed outside Neovim (e.g., by git)

-- Message verbosity
-- See :help 'shortmess' for all flags
-- Example: 'c' avoids "match 1 of N" during completion, 'A' avoids startup messages for reading files
opt.shortmess = opt.shortmess + "c" + "A" + "I" -- Add flags, 'I' to suppress intro message

-- Folding (very basic, often overridden by plugins like nvim-treesitter or dedicated folding plugins)
-- opt.foldmethod = "indent" -- Example: fold by indent
-- opt.foldlevel = 99        -- Start with all folds open
-- opt.foldenable = true

-- Global Variables
g.loaded_netrw = 1        -- Disable the built-in Netrw file explorer
g.loaded_netrwPlugin = 1  -- if you are using a plugin like neo-tree


-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
