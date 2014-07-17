" Eliminate ESC key delay
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Disable mouse clicks.
nnoremap <LeftMouse> <nop>
nnoremap <MiddleMouse> <nop>
nnoremap <RightMouse> <nop>

" Clear search highlight
command C let @/=""

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc