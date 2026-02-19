return {
  'let-def/texpresso.vim',
  ft = { 'tex' },
  config = function()
    -- Make sure nvim can find the binaries (macOS GUI/PATH gotcha)
    vim.env.PATH = '/opt/homebrew/bin:/usr/local/bin:' .. vim.env.PATH

    -- If `texpresso` isn't in PATH, hardcode it instead:
    -- vim.g.texpresso_bin = vim.fn.expand("~/Research/livetex/texpresso/build/texpresso")

    -- Optional: open TeXpresso for the root file you choose
    vim.keymap.set('n', '<leader>tp', function()
      -- launches for current file; change to "main.tex" if you work in subfiles
      vim.cmd 'TeXpresso %'
    end, { desc = 'TeXpresso preview' })

    -- Most common cause of black window: wrong working directory.
    -- This makes TeXpresso run from the current file's folder.
    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'tex',
      callback = function()
        vim.cmd 'silent! lcd %:p:h'
      end,
    })
  end,
}
