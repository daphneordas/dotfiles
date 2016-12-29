"vim-plug
call plug#begin('~/.vim/plugged')

"This is the Vundle package, which can be found on GitHub.
"For GitHub repos, you specify plugins using the
"'user/repository' format

"vim-airline for statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"vim-airline settings
"enable 256 colors in vim
set t_Co=256
let g:airline_powerline_fonts = 1
let g:airline_theme='light'
"display full path in statusline
let g:airline_section_c='%F'

"Things that don't have anything to do with plugins
"Appearance
set number
colorscheme elflord
"make EOL newline go away
set fileformats+=dos
set scrolloff=99

"prevent pause in leaving insert mode
set ttimeoutlen=50
"enable unicode in vim
set encoding=utf-8

syntax enable
"statusline
set laststatus=2

"Tabs
set shiftwidth=4
set tabstop=4
set autoindent

"Searching
set ignorecase
set hlsearch

"Keymappings
map Q :nohlsearch<CR>

syntax on

map ,d :!git diff % <CR>

imap jj <Esc>

noremap <S-Enter> O<Esc>

nnoremap <C-j> :m .+1<CR>==
nnoremap <C-k> :m .-2<CR>==
inoremap <C-j> <Esc>:m .+1<CR>==gi
inoremap <C-k> <Esc>:m .-2<CR>==gi
cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):(    'W'))
cnoreabbrev <expr> Q ((getcmdtype() is# ':' && getcmdline() is# 'Q')?('q'):(    'Q'))

"disable arrow keys in normal mode
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>

"better split handling
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-L> <C-W><C-L>
