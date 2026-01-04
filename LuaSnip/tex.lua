local ls = require 'luasnip'
local s, t, i = ls.snippet, ls.text_node, ls.insert_node

-- make tex snippets also available in plaintex/latex
ls.filetype_extend('plaintex', { 'tex' })
ls.filetype_extend('latex', { 'tex' })

ls.add_snippets('tex', {
  s('enum', {
    t { '\\begin{enumerate}', '\t\\item ' },
    i(1),
    t { '', '\\end{enumerate}' },
  }),

  -- todo → \todo{<cursor>}
  s({ trig = 'todo', wordTrig = false }, {
    t '\\todo{',
    i(1),
    t '}',
  }),
  s('fig', {
    t { '\\begin{figure}[htbp]', '\t\\centering', '\t\\includegraphics[width=' },
    c(1, { t '\\linewidth', t '0.8\\linewidth', t '0.6\\linewidth' }),
    t ']{',
    i(2, 'figures/name'),
    t { '}', '\t\\caption{' },
    i(3, 'Caption'),
    t { '}', '\t\\label{fig:' },
    f(function(args)
      return slugify(args[2][1])
    end, { 2 }),
    t { '}', '\\end{figure}' },
    i(0),
  }),
  s('sec', {
    t '\\section{',
    i(1, 'Title'),
    t { '}', '\\label{sec:' },
    f(function(args)
      return slugify(args[1][1])
    end, { 1 }),
    t '}',
    i(0),
  }),
})
