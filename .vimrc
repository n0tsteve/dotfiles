"           _                    
"    __   _(_)_ __ ___  _ __ ___ 
"    \ \ / / | '_ ` _ \| '__/ __|
" _   \ V /| | | | | | | | | (__ 
"(_)   \_/ |_|_| |_| |_|_|  \___|
"

set laststatus=2
map <C-n> :NERDTreeToggle<CR>
set statusline+=%#warningmsg#
set noshowmode

set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

set number

if !has('gui_running')
  set t_Co=256
endif

let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }

call plug#begin('~/.vim/plugged')
Plug 'itchyny/lightline.vim'
" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'
" https://vimawesome.com/plugin/syntastic
Plug 'vim-syntastic/syntastic'
Plug 'jcherven/jummidark.vim'
Plug 'pgavlin/pulumi.vim'
Plug 'victorze/foo'
Plug 'stillwwater/vim-nebula'
Plug 'morhetz/gruvbox'
Plug 'shinchu/lightline-gruvbox.vim'
call plug#end()

set background=dark
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=none
