filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" ########## My Bundles Here ##########
Bundle 'gerw/vim-HiLinkTrace'
"Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'chriskempson/base16-vim'
Bundle 'vim-ruby/vim-ruby'
" ########## Bundle Ends ##########

filetype plugin indent on     " required!
