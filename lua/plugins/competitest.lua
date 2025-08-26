return {
  'xeluxee/competitest.nvim',
  cmd = {
    'CompetiTest',
    'CompetiTestAdd',
    'CompetiTestRun',
    'CompetiTestReceive',
  },
  dependencies = 'MunifTanjim/nui.nvim',
  config = function()
    require('competitest').setup {
      companion_port = 27121,

      -- === HOW TO COMPILE ===
      compile_command = {
        cpp = {
          exec = 'g++-15', -- homebrew GCC
          args = {
            '-std=c++17', -- or -std=c++20
            '-O2',
            '-pipe',
            '$(FNAME)', -- e.g. “Broken Necklace.cpp”
            '-o',
            '$(FNOEXT)', -- e.g. “Broken Necklace”
          },
        },
        -- For Python you usually don’t need a compile step.
        -- Remove or leave empty to skip; or enable syntax check:
        python = {
          exec = 'python3',
          args = { '-m', 'py_compile', '$(FNAME)' },
        },
      },

      -- === HOW TO RUN ===
      run_command = {
        cpp = {
          exec = './$(FNOEXT)', -- run your compiled binary
          args = { '<', '$(FNOEXT)_input$(TCNUM).txt' }, -- feeds sample input files
        },
        python = {
          exec = 'python3',
          args = { '$(FNAME)' }, -- simple “python3 script.py”
          -- if you want file-based inputs instead, use:
          -- args = { '$(FNAME)', '<', '$(FNOEXT)_input$(TCNUM).txt' },
        },
      },

      -- === DEFAULT TESTCASE STORAGE ===
      testcases_use_single_file = false, -- one .txt per test
      testcases_input_file_format = '$(FNOEXT)_input$(TCNUM).txt',
      testcases_output_file_format = '$(FNOEXT)_output$(TCNUM).txt',

      -- === UI / RECEIVE SETTINGS ===
      start_receiving_persistently_on_setup = false, -- manual `:CompetiTestReceive`
      received_files_extension = 'cpp',
      template_file = false, -- no auto‐template
    }
  end,
}
