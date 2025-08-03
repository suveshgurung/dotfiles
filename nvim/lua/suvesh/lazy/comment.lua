return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require('Comment').setup({
      toggler = {
        line = '<leader>/',  -- Line-comment toggle keymap
        block = '<C-/>', -- Block-comment toggle keymap
      },
      opleader = {
        line = '<leader>/',   -- Line-comment keymap
        block = '<C-/>',  -- Block-comment keymap
      },
    })
  end,
}
