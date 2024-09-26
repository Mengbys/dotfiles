" Basic setting
" =============
syntax on
filetype on
filetype plugin on
filetype indent on
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
let $LANG='en'
set langmenu=en
set tabstop=4     " A tab equals 4 spaces
set shiftwidth=4  " The width of suojin is 4 space
set expandtab     " Use space replace tab
set softtabstop=4 " Del tabs one by one when use backspace
set autoindent
set smartindent
set nocompatible
set number
set ignorecase
set cursorline
set noundofile
set nobackup
set noswapfile
set spr                        " Split to right when vertical split
set sb                         " Split to bottom when horizon split
set autoread                   " Auto refresh when file change
set signcolumn=number          " Sign show in number column
set completeopt-=preview       " Close preview windows
set whichwrap=<,>,[,]          " Alow arrow keys jump between lines automatically
set backspace=indent,eol,start " Allow backspace delete previous lines, have in `vimrc_example.vim`
set linespace=0                " the space between lines
set fileformat=unix
set wildmenu
set mouse=a
set nowrap
set path+=**
set hls
set smartcase


" Autocommand
" ===========
autocmd filetype help nnoremap <silent><buffer> q :exit<CR>
autocmd filetype vim,yaml,lua,sh setlocal tabstop=2 | setlocal shiftwidth=2 | setlocal softtabstop=2

" Key mapping
" ===========
let mapleader = ","
" Buffer operation
nnoremap <silent> <c-p> :bp!<cr>
nnoremap <silent> <c-n> :bn!<cr>
nnoremap <silent> <leader>d :bd<cr>
" Window operation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-down> <c-w>J
nnoremap <c-up> <c-w>K
nnoremap <c-left> <c-w>H
nnoremap <c-right> <c-w>L
" Yank to clipboard
vnoremap <leader>y "+y
nnoremap <leader>ay ggVG"+y
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nnoremap <leader>h :Startify<cr>
" Tab operation
nnoremap <leader>e :tabn<cr>
nnoremap <leader>q :tabp<cr>
nnoremap <leader>w :tabc<cr>
nnoremap <leader>s :w<cr>
nnoremap <leader>cd :cd %:p:h<cr>

" Gui setting
" ===========
if has("gui_running")
  " Solve the display problem of gvim in Chinese Windows
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim

  " Fonts
  set guifont=MesloLGMNFM-Regular:h14:cANSI
  " set guifontwide=Microsoft_YaHei_Mono:h11:cGB2312

  " Make a clean ui
  set guioptions-=m           " Eliminate menu
  set guioptions-=T           " Eliminate toolbar
  set guioptions-=L           " Eliminate left scroll bar
  set guioptions-=r           " Eliminate right scroll bar
  set guioptions-=b           " Eliminate bottom scroll bar
  set guioptions-=e           " Eliminate tabline

  set vb t_vb=            " Close noise
  au GuiEnter * set t_vb= " Close window blink
endif

" MacVim setting
" ==============
if has('gui_macvim')
  " MacVim ligatures support
  " set noanti
  " set macligatures
  set guifont=BlexMonoNFM:h14
  hi HomepageHeader guifg=#ffa0a0 ctermfg=13
endif


" Autopairs
" =========
" inoremap ( ()<Left>
" inoremap [ []<Left>
" inoremap { {}<Left>
" inoremap < <><Left>
" inoremap ' ''<Left>
" inoremap " ""<Left>


" Homepage Customization
" ======================
let g:homepage_header=[
    \'⣿⡇⣿⣿⣿⠛⠁⣴⣿⡿⠿⠧⠹⠿⠘⣿⣿⣿⡇⢸⡻⣿⣿⣿⣿⣿⣿⣿ ',
    \'⢹⡇⣿⣿⣿⠄⣞⣯⣷⣾⣿⣿⣧⡹⡆⡀⠉⢹⡌⠐⢿⣿⣿⣿⡞⣿⣿⣿ ',
    \'⣾⡇⣿⣿⡇⣾⣿⣿⣿⣿⣿⣿⣿⣿⣄⢻⣦⡀⠁⢸⡌⠻⣿⣿⣿⡽⣿⣿ ',
    \'⡇⣿⠹⣿⡇⡟⠛⣉⠁⠉⠉⠻⡿⣿⣿⣿⣿⣿⣦⣄⡉⠂⠈⠙⢿⣿⣝⣿ ',
    \'⠤⢿⡄⠹⣧⣷⣸⡇⠄⠄⠲⢰⣌⣾⣿⣿⣿⣿⣿⣿⣶⣤⣤⡀⠄⠈⠻⢮ ',
    \'⣿⣿⣧⠄⢘⢻⣿⡇⢀⣀⠄⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⡀⠄⢀ ',
    \'⣿⣿⣿⡆⢸⣿⣿⣿⣬⣭⣴⣿⣿⣿⣿⣿⣿⣿⣯⠝⠛⠛⠙⢿⡿⠃⠄⢸ ',
    \'⣿⣿⢿⣿⡀⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣿⣿⣿⣿⡾⠁⢠⡇⢀ ',
    \'⣿⣿⢸⣿⡇⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣏⣫⣻⡟⢀⠄⣿⣷⣾ ',
    \'⣿⣿⢸⣿⡇⠄⠈⠙⠿⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⣿⡿⢠⠊⢀⡇⣿⣿ ',
    \'⣿⣿ ⣿⡇⢀⡲⠄⠄⠈⠙⠻⢿⣿⣿⠿⠿⠟⠛⠋⠁⣰⠇ ⢸⣿⣿⣿ ',
    \'⣿⣿ ⣿⡇⢬⡻⡇⡄⠄⠄⠄⡰⢖⠔⠉⠄⠄⠄⠄⣼⠏  ⢸⣿⣿⣿ ',
    \'⣿⣿⣿ ⡇⠄⠙⢌⢷⣆⡀⡾⡣⠃⠄⠄⠄⠄⠄⣼⡟    ⢿⣿⣿ ',
    \]

hi HomepageHeader guifg=#ffa0a0 ctermfg=13
for item in g:homepage_header
  let pattern='\V' . item
  call matchadd('HomepageHeader',pattern)
endfor


function! ShowHomepage()
  silent! execute 'enew'

  put =g:homepage_header
  put =''
  put ='Welcome!'
  put =''
  put ='<e> new <m> old <q> quit'
  normal! ggddG
  setlocal nonu
  setlocal nomodifiable
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal filetype=homepage
endfunction

if argc()==0
  autocmd VimEnter * call ShowHomepage()
endif
autocmd FileType homepage nnoremap <buffer> e :enew<cr>
autocmd FileType homepage nnoremap <buffer> m :bro ol<cr>
autocmd FileType homepage nnoremap <buffer> q :exit<cr>

function! ToggleHomepage()
  if &filetype=='homepage'
    silent! execute "normal! \<C-^>"
  else
    call ShowHomepage()
  endif
endfunction

nnoremap <silent> <leader>h :call ToggleHomepage()<cr>
