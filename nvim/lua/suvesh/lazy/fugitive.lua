return {
  "tpope/vim-fugitive",
  dependencies = {
    "tpope/vim-rhubarb",
  },
  cmd = {
    "G",
    "Git",
    "Gdiffsplit",
    "Gread",
    "Gwrite",
    "Ggrep",
    "GMove",
    "GDelete",
    "GBrowse",
    "GRemove",
    "GRename",
    "Glgrep",
    "Gedit"
  },
  ft = {"fugitive"},
  keys = {
    -- Basic Git operations
    { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
    { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff split" },
    { "<leader>gc", "<cmd>Git commit<cr>", desc = "Git commit" },
    { "<leader>gca", "<cmd>Git commit --amend<cr>", desc = "Git commit amend" },
    { "<leader>gp", "<cmd>Git push<cr>", desc = "Git push" },
    { "<leader>gpl", "<cmd>Git pull<cr>", desc = "Git pull" },
    
    -- Branch operations
    { "<leader>gb", "<cmd>Git branch<cr>", desc = "Git branch" },
    { "<leader>gco", "<cmd>Git checkout<cr>", desc = "Git checkout" },
    { "<leader>gcb", ":Git checkout -b ", desc = "Git checkout new branch" },
    { "<leader>gm", "<cmd>Git merge<cr>", desc = "Git merge" },
    
    -- Log and history
    { "<leader>gl", "<cmd>Git log --oneline<cr>", desc = "Git log oneline" },
    { "<leader>gll", "<cmd>Git log<cr>", desc = "Git log" },
    { "<leader>glg", "<cmd>Git log --graph --oneline --all<cr>", desc = "Git log graph" },
    
    -- Staging operations
    { "<leader>ga", "<cmd>Git add .<cr>", desc = "Git add all" },
    { "<leader>gaa", "<cmd>Git add --all<cr>", desc = "Git add --all" },
    { "<leader>gu", "<cmd>Git reset<cr>", desc = "Git unstage" },
    { "<leader>guh", "<cmd>Git reset --hard<cr>", desc = "Git reset hard" },
    
    -- Remote operations
    { "<leader>gf", "<cmd>Git fetch<cr>", desc = "Git fetch" },
    { "<leader>gr", "<cmd>Git rebase<cr>", desc = "Git rebase" },
    { "<leader>gri", "<cmd>Git rebase -i<cr>", desc = "Git rebase interactive" },
    
    -- File operations
    { "<leader>gw", "<cmd>Gwrite<cr>", desc = "Git write (stage current file)" },
    { "<leader>ge", "<cmd>Gedit<cr>", desc = "Git edit" },
    { "<leader>gre", "<cmd>Gread<cr>", desc = "Git read (checkout current file)" },
    
    -- Diff operations
    { "<leader>gdv", "<cmd>Gvdiffsplit<cr>", desc = "Git diff vertical split" },
    { "<leader>gdh", "<cmd>Gdiffsplit<cr>", desc = "Git diff horizontal split" },
    
    -- Blame and browse
    { "<leader>gbl", "<cmd>Git blame<cr>", desc = "Git blame" },
    { "<leader>gbr", "<cmd>GBrowse<cr>", desc = "Git browse (GitHub)" },
    
    -- Stash operations
    --[[ { "<leader>gst", "<cmd>Git stash<cr>", desc = "Git stash" },
    { "<leader>gsp", "<cmd>Git stash pop<cr>", desc = "Git stash pop" },
    { "<leader>gsl", "<cmd>Git stash list<cr>", desc = "Git stash list" }, ]]
    
    -- Quick commit
    { "<leader>gqc", ":Git commit -m \"", desc = "Quick commit with message" },
    { "<leader>gqca", ":Git commit -am \"", desc = "Quick commit all with message" },
  },
  config = function()
    -- Custom Git command shortcuts
    vim.api.nvim_create_user_command("Gpush", "Git push", {})
    vim.api.nvim_create_user_command("Gpull", "Git pull", {})
    vim.api.nvim_create_user_command("Gfetch", "Git fetch", {})
    vim.api.nvim_create_user_command("Gstatus", "Git", {})
    
    -- Auto-open quickfix for Git grep
    vim.api.nvim_create_autocmd("QuickFixCmdPost", {
      pattern = "*grep*",
      command = "cwindow",
    })
    
    -- Fugitive-specific keymaps (only in fugitive buffers)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "fugitive",
      callback = function()
        local opts = { buffer = true, silent = true }
        
        -- In fugitive status window
        vim.keymap.set("n", "<leader>p", "<cmd>Git push<cr>", vim.tbl_extend("force", opts, { desc = "Push" }))
        vim.keymap.set("n", "<leader>P", "<cmd>Git pull<cr>", vim.tbl_extend("force", opts, { desc = "Pull" }))
        vim.keymap.set("n", "<leader>t", "<cmd>Git push -u origin ", vim.tbl_extend("force", opts, { desc = "Push upstream" }))
        vim.keymap.set("n", "<leader>f", "<cmd>Git fetch<cr>", vim.tbl_extend("force", opts, { desc = "Fetch" }))
        vim.keymap.set("n", "<leader>c", "<cmd>Git commit<cr>", vim.tbl_extend("force", opts, { desc = "Commit" }))
        vim.keymap.set("n", "<leader>r", "<cmd>Git rebase<cr>", vim.tbl_extend("force", opts, { desc = "Rebase" }))
        vim.keymap.set("n", "<leader>l", "<cmd>Git log --oneline<cr>", vim.tbl_extend("force", opts, { desc = "Log" }))
      end,
    })
    
    -- Git diff navigation keymaps
    vim.api.nvim_create_autocmd("FileType", {
      pattern = {"git", "gitcommit"},
      callback = function()
        local opts = { buffer = true, silent = true }
        vim.keymap.set("n", "]c", "/^@@<cr>", vim.tbl_extend("force", opts, { desc = "Next change" }))
        vim.keymap.set("n", "[c", "?^@@<cr>", vim.tbl_extend("force", opts, { desc = "Previous change" }))
      end,
    })
    
    -- Set up nice status line integration
    vim.g.fugitive_git_executable = 'git'
    
    -- Configure fugitive to open in new tab by default
    vim.g.fugitive_browse_split = 0
  end,
}
