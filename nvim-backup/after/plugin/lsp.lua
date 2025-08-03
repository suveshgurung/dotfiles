require("fidget").setup({})

require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗"
		}
	}
})

local handlers = {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup {}
  end,

  -- targeted handlers
  ["lua_ls"] = function ()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup {
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" }
          }
        }
      }
    }
  end,
}

require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "cmake", "cssls", "tailwindcss", "html", "ts_ls", "ast_grep", "marksman", "pylsp", "volar" }
})

require("mason-lspconfig").setup_handlers(handlers)

local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})
