return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "treesitter-playground",
    "nvim-treesitter-textobjects",
  },
  config = function()
    require'nvim-treesitter.configs'.setup {
      ensure_installed = { 
        "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", 
        "javascript", "typescript", "cpp", "css", "html", "rust", "vue", "yaml", "python" 
      },
      sync_install = false,
      auto_install = true,
      
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      
      indent = {
        enable = true,
      },
      
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          scope_incremental = "<S-CR>",
          node_decremental = "<BS>",
        },
      },
    }
  end,
}
