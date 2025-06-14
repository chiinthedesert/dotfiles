-- Options inspired by kickstart.nvim
-- Set to true if your terminal uses a Nerd Font
vim.g.have_nerd_font = true

-- [[ General Settings ]]
vim.o.mouse = 'a'                -- Enable mouse support
vim.o.showmode = false           -- Don't show mode in cmd line (statusline handles it)
vim.o.clipboard = 'unnamedplus'  -- Use system clipboard
vim.o.confirm = true             -- Confirm quit/save dialogs
vim.o.undofile = true            -- Enable persistent undo
vim.o.swapfile = false           -- Disable swap files
vim.o.backup = false             -- No backup files
vim.o.writebackup = false        -- No backup before overwrite
vim.o.virtualedit = 'block'      -- Allow cursor anywhere in visual block mode
vim.g.loaded_netrw = 1           -- Disable netrw
vim.g.loaded_netrwPlugin = 1

-- [[ UI Settings ]]
vim.o.termguicolors = true       -- Enable 24-bit color
vim.o.number = true              -- Line numbers
vim.o.relativenumber = true      -- Relative line numbers
vim.o.signcolumn = 'yes'         -- Always show sign column
vim.o.cursorline = true          -- Highlight current line
vim.o.wrap = false               -- Disable line wrap
vim.o.scrolloff = 10             -- Padding above/below cursor
vim.o.sidescrolloff = 10         -- Keep columns left/right of cursor
vim.o.breakindent = true         -- Keep indent on wrapped lines
vim.o.list = true                -- Show invisible characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', extends = '⟩', precedes = '⟨' }

-- [[ Indentation ]]
vim.opt.tabstop = 2              -- Tab width
vim.opt.shiftwidth = 2           -- Indent width
vim.opt.softtabstop = 2          -- Tab key width
vim.opt.expandtab = true         -- Use spaces instead of tabs
vim.opt.autoindent = true
vim.opt.smartindent = true

-- [[ Search ]]
vim.o.ignorecase = true          -- Case-insensitive by default
vim.o.smartcase = true           -- ...but case-sensitive if capital letters used
vim.o.inccommand = 'split'       -- Live preview of :substitute

-- [[ Split Behavior ]]
vim.o.splitright = true          -- Vertical split to the right
vim.o.splitbelow = true          -- Horizontal split below

-- [[ Performance ]]
vim.o.updatetime = 250           -- Faster completion
vim.o.timeoutlen = 300           -- Keymap timeout

-- [[ Autocommands ]]
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
