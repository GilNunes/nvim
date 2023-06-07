return {
    { "gmr458/vscode_dark_modern.nvim" },
    { "rose-pine/neovim" },
    { "folke/tokyonight.nvim" },
    { "ThePrimeagen/vim-be-good" },
    { 'doums/darcula' },
    { "mg979/vim-visual-multi" },
    { "bfrg/vim-cpp-modern" },
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
    {
        "folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent",
                floats = "transparent",
            },
        },
    },

    -- Configure LazyVim to load gruvbox
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "tokyonight-night",
        },
    },
}
