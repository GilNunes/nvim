-- Set leader key early
vim.g.mapleader = " "
-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim
require("lazy").setup({
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
},
    {'sbdchd/neoformat'},
  -- Telescope and its dependencies
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- Tree-sitter and its dependencies
  {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  },
{'akinsho/toggleterm.nvim', version = "*", config = true},
{
    "williamboman/mason.nvim"
},
    {'nvim-tree/nvim-tree.lua'},
    {'xiyaowong/transparent.nvim'},
    {'olivercederborg/poimandres.nvim',
    config = function()
        -- Set the poimandres color scheme
        -- vim.cmd('colorscheme poimandres')
    end},
	 {
	   "rockyzhang24/arctic.nvim",
	   dependencies = { "rktjmp/lush.nvim" },
	   name = "arctic",
	   branch = "v2",
	   priority = 1000,
	   config = function()
	     vim.cmd("colorscheme arctic")
	   end
	 },

	{'tpope/vim-commentary'},
    {'mg979/vim-visual-multi'},
{
  "christoomey/vim-tmux-navigator",
  cmd = {
    "TmuxNavigateLeft",
    "TmuxNavigateDown",
    "TmuxNavigateUp",
    "TmuxNavigateRight",
    "TmuxNavigatePrevious",
  },
  keys = {
    { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
    { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
    { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
    { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
    { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
  },
}
})

require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {}, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
-- Telescope configuration
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  }
}
-- Tree-sitter configuration
require('nvim-treesitter.configs').setup {
  ensure_installed = { "c","cpp", "lua", "python"}, -- List of parsers to install
  sync_install = false,
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true
  },
}
-- Unmap <C-p> in normal, visual, and insert modes
vim.api.nvim_set_keymap('n', '<C-p>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-p>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-p>', '', { noremap = true, silent = true })
-- Unmap <C-f> in normal, visual, and insert modes
vim.api.nvim_set_keymap('n', '<C-f>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-f>', '', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-f>', '', { noremap = true, silent = true })

-- Keybindings for Telescope
vim.api.nvim_set_keymap('n', '<C-p>', '<cmd>Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', '<cmd>Telescope live_grep<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { noremap = true, silent = true })


vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- search settings
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.cmd("set nofixendofline")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- clipboard
-- Enable clipboard support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.api.nvim_set_option("clipboard", "unnamedplus")
-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- Map Ctrl-Shift-c to copy to the system clipboard in visual mode
vim.api.nvim_set_keymap('v', '<C-c>', '"+y', { noremap = true, silent = true })

-- Map Ctrl-Shift-v to paste from the system clipboard in normal mode
vim.api.nvim_set_keymap('n', '<C-S-v>', '"+p', { noremap = true, silent = true })

-- Map Ctrl-Shift-v to paste from the system clipboard in visual mode
vim.api.nvim_set_keymap('v', '<C-S-v>', '"+p', { noremap = true, silent = true })

-- Map Ctrl-\ to split the window horizontally
vim.api.nvim_set_keymap('n', '<C-\\>', ':vsplit<CR>', { noremap = true, silent = true })


vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 250 }
  end,
})
-- Then configure the keybinding
require("toggleterm").setup{
  open_mapping = [[<A-j>]],
 direction = 'horizontal', -- or 'horizontal' or 'vertical'
  size = 20,
  -- you can add other configurations here
}

-- Map Ctrl + c to Ctrl + \ Ctrl + n in terminal mode
vim.api.nvim_set_keymap('t', '<C-h>', '<C-\\><C-n>:wincmd h<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-\\><C-n>:wincmd j<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-\\><C-n>:wincmd k<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-l>', '<C-\\><C-n>:wincmd h<CR>', { noremap = true, silent = true })
require("mason").setup()




-- Configure neoformat
vim.g.neoformat_enabled_cpp = { "clangformat" }

-- Run neoformat on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.cpp", "*.h", "*.hpp", "*.cc", "*.hh" },
  command = "Neoformat"
})

-- Enable undo files
vim.opt.undofile = true

-- Specify the directory for undo files (optional)
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undo")

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true


-- Require the nvim-tree plugin
local nvim_tree = require('nvim-tree')

-- Setup nvim-tree (optional, you can customize settings here)
nvim_tree.setup { }

-- Define the key mapping for toggling Nvim Tree
vim.api.nvim_set_keymap('n', '<C-e>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- Define the key mapping for toggling Nvim Tree
vim.api.nvim_set_keymap('n', '<C-b>', ':NvimTreeClose<CR>', { noremap = true, silent = true })


require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'arctic',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
