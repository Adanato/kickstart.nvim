return {
  'L3MON4D3/LuaSnip',
  version = 'v2.*',
  build = 'make install_jsregexp',
  config = function()
    local ls = require 'luasnip'

    -- LuaSnip settings
    ls.config.set_config {
      enable_autosnippets = true,
      store_selection_keys = '<Tab>',
    }

    -- Keymaps (Vimscript style)
    vim.cmd [[
      " Use Tab to expand and jump through snippets
      imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
      smap <silent><expr> <Tab> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<Tab>'

      " Use Shift-Tab to jump backwards through snippets
      imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
      smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'

      " Choice nodes: cycle forward with Ctrl-f
      imap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
      smap <silent><expr> <C-f> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
    ]]

    -- Load snippets
    require('luasnip.loaders.from_lua').load {
      paths = '~/.config/nvim/LuaSnip/',
    }
  end,
}
