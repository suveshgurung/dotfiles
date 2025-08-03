return {
  {
    "sainnhe/everforest",
    priority = 1000, -- Load first
    config = function()
      vim.g.everforest_background = 'medium'  -- 'hard', 'medium', 'soft'
      vim.g.everforest_better_performance = 1
      vim.g.everforest_enable_italic = 1
      vim.g.everforest_disable_italic_comment = 0

      vim.cmd("colorscheme everforest")
    end,
  },

  { 
    "nvim-lua/plenary.nvim", 
    name = "plenary"
  },

  {
    "nvim-treesitter/playground",
    name = "treesitter-playground",
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    name = "nvim-treesitter-textobjects",
  },
  
  "numToStr/Comment.nvim",
  "tpope/vim-fugitive",
  "folke/zen-mode.nvim",
  "laytan/cloak.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    name = "nvim-tree-icons"
  }
}
