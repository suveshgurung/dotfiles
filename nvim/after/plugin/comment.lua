require('Comment').setup()
vim.keymap.set({"n", "v"}, "<leader>/", "<Plug>(comment_toggle_linewise_visual)", { silent = true })
