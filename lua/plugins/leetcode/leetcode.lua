return {
  'kawre/leetcode.nvim',
  -- auto-update the HTML parser if nvim-treesitter is installe
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    -- picker of your choice (already have telescope)
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    ---------------------------------
    -- ✨  core settings
    ---------------------------------
    lang = 'python3', -- default language (change to "python3", "rust", …)
    cache = { -- re-fetch problem list once a week
      update_interval = 60 * 60 * 24 * 7,
    },
    description = { -- put problem statement on the left
      position = 'left',
      width = '40%',
    },
    picker = { provider = 'telescope' }, -- use the familiar ⌘-T finder
    plugins = {
      non_standalone = false, -- set true if you'll *always* run :Leet inside a normal session
    },
    -- uncomment if you use leetcode.cn
    -- cn = { enabled = true, translator = true, translate_problems = true },
  },
}
