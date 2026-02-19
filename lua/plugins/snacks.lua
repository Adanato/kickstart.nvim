-- Snacks.nvim base configuration
-- Adds vim-tmux-navigator keymaps to Snacks terminal style so
-- Ctrl+hjkl navigates out of terminal buffers fluidly.
return {
  'folke/snacks.nvim',
  opts = {
    bigfile = { enabled = true },
    styles = {
      terminal = {
        keys = {
          nav_h = { '<c-h>', function() vim.cmd('TmuxNavigateLeft') end, mode = 't', desc = 'Navigate left' },
          nav_j = { '<c-j>', function() vim.cmd('TmuxNavigateDown') end, mode = 't', desc = 'Navigate down' },
          nav_k = { '<c-k>', function() vim.cmd('TmuxNavigateUp') end, mode = 't', desc = 'Navigate up' },
          nav_l = { '<c-l>', function() vim.cmd('TmuxNavigateRight') end, mode = 't', desc = 'Navigate right' },
        },
      },
    },
  },
}
