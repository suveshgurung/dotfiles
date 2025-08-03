local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fw', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope buffers' })

require('telescope').setup({
  defaults = {
    mappigs = {
      n = {
        ["<C-x>"] = "delete_buffer",
      },
    }
  }
})
