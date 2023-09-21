return {

  { "doums/darcula" },

  { "xiyaowong/transparent.nvim" },

  { "tpope/vim-surround" },

  { "sindrets/diffview.nvim" },

  { "christoomey/vim-tmux-navigator" },

  { "mhartington/formatter.nvim" },

  { "rhysd/vim-clang-format" },
  {
    "sindrets/diffview.nvim",
  },
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "darcula",
    },
  },
}
