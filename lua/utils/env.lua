-- restore the terminal cursor when escaping
vim.cmd([[
  if $TERM_PROGRAM =~ "iTerm"
    " reset cursor when vim exits
    au VimLeave * set guicursor=a:ver25-blinkon0
  endif
]])
