filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
" ########## My Plugins Here ##########
Plugin 'gerw/vim-HiLinkTrace'
"Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
" ########## Plugins Ends ##########
call vundle#end()
filetype plugin indent on     " required!
