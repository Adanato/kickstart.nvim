return {
  'coder/claudecode.nvim',
  dependencies = { 'folke/snacks.nvim' },
  opts = {
    track_selection = true,
    terminal = {
      split_side = 'right',
      split_width_percentage = 0.35,
    },
    diff = {
      layout = 'vertical',
    },
  },
  keys = {
    { '<leader>cc', '<cmd>ClaudeCode<cr>', desc = 'Toggle Claude Code' },
    { '<leader>cf', '<cmd>ClaudeCodeFocus<cr>', desc = 'Focus Claude Code' },
    { '<leader>cs', '<cmd>ClaudeCodeSend<cr>', mode = 'v', desc = 'Send to Claude Code' },
    { '<leader>cb', '<cmd>ClaudeCodeAdd %<cr>', desc = 'Add buffer to Claude' },
    { '<leader>ca', '<cmd>ClaudeCodeDiffAccept<cr>', desc = 'Accept Claude diff' },
    { '<leader>cd', '<cmd>ClaudeCodeDiffDeny<cr>', desc = 'Deny Claude diff' },
  },
}
