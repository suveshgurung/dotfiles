require('lualine').setup {
  options = {
    theme = 'dracula',  -- or any theme you prefer
    path = 1            -- 1 shows the path relative to the working directory
  },
  sections = {
    lualine_c = {
      { 'filename', path = 1 }  -- Shows relative path of the filename
    }
  }
}
