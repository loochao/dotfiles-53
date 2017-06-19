"================================================================
" Basic keymaps
"================================================================

source ~/.vimrc.keymap

"================================================================
" Plugins
"================================================================
call plug#begin()

Plug 'tpope/vim-surround'
Plug 'w0ng/vim-hybrid'
Plug 'itchyny/lightline.vim'
Plug 'thinca/vim-localrc'

" ========== Unite.vim ==========
Plug 'Shougo/unite.vim'
let g:unite_enable_start_insert=1
"スペースキーとfキーでカレントディレクトリを表示
nnoremap <silent> <Leader>f :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
"スペースキーとrキーでレジストリを表示
nnoremap <silent> <Leader>r :<C-u>Unite<Space>register<CR>
"スペースキーとtキーでタブを表示
nnoremap <silent> <Leader>t :<C-u>Unite<Space>tab<CR>
"スペースキーとhキーでヒストリ/ヤンクを表示
nnoremap <silent> <Leader>h :<C-u>Unite<Space>history/yank<CR>
" 大文字小文字を区別しない  
let g:unite_enable_ignore_case = 1  
let g:unite_enable_smart_case = 1
" ESCキーを2回押すと終了する  
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
" grep検索
nnoremap <silent> <Leader>g  :<C-u>Unite grep:! -buffer-name=search-buffer<CR>
nnoremap <silent> <Leader>G  :<C-u>Unite grep:! -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:! -buffer-name=search-buffer<CR><C-R><C-W>
nnoremap <silent> ,cG :<C-u>Unite grep:! -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" .git以下のファイル検索
nnoremap <silent> ,e  :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> <Leader>e  :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> <Leader>s :<C-u>Unite -buffer-name=search line<CR>
" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column --smart-case --hidden -U'
  let g:unite_source_grep_recursive_opt = ''
endif

" ========== neocomplcache ==========
Plug 'Shougo/neocomplcache'
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

"
Plug 'Shougo/neomru.vim'
"スペースキーとbキーでバッファと最近開いたファイル一覧を表示
nnoremap <silent> <Leader>b :<C-u>Unite<Space>buffer file_mru<CR>

"
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

"
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

"
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
Plug 'tyru/open-browser.vim'
Plug 'kannokanno/previm'
let g:previm_custom_css_path = '~/dotfiles/markdown_custom.css'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
nnoremap [previm] <Nop>
nmap <Space>p [previm]
nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
nnoremap <silent> [previm]r :call previm#refresh()<CR>

"
Plug 'w0rp/ale'
set nocompatible
filetype off
let &runtimepath.=',~/.vim/plugged/ale'
filetype plugin on


call plug#end()

"================================================================
" basic settings
"================================================================

" 
syntax enable
set cursorline
set number

set wildmode=longest,full

" search settings
set hlsearch
set smartcase

set showmatch 

set list           " 不可視文字を表示
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮    " 不可視文字の表示記号指定

set mouse=a

set clipboard=unnamed,autoselect

set visualbell

set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" indent settings
set autoindent
set smartindent

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set splitright
set splitbelow

set showcmd
set showmode
set laststatus=2
set cmdheight=2
set ruler

" file settings
set confirm
set hidden
set autoread
set noswapfile
set nobackup

" allow to create new line in INSERT mode
set bs=start,indent
set backspace=indent,eol,start

" do not stop cursor at an end of line
set whichwrap=b,s,h,l,<,>,[,],~

" change cursor shape when insert mode
if &term =~ "screen"
  let &t_SI = "\eP\e]50;CursorShape=1\x7\e\\"
  let &t_EI = "\eP\e]50;CursorShape=0\x7\e\\"
elseif &term =~ "xterm"
  let &t_SI = "\e]50;CursorShape=1\x7"
  let &t_EI = "\e]50;CursorShape=0\x7"
endif

" indent settings
autocmd FileType json setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType yml  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType xml  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType sh   setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType zsh  setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType rb   setlocal shiftwidth=2 tabstop=2 softtabstop=2

" use hard tab when Makefile
let _curfile=expand("%:r")
if _curfile == 'Makefile' || _curfile == 'makefile'
  set noexpandtab
endif

"
augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

"================================================================
" Color settings
"================================================================

set background=dark
colorscheme hybrid
"
" highlights
hi MatchParen term=standout ctermbg=blue ctermfg=white
hi SpellBad ctermbg=Red
hi SpellCap ctermbg=Yellow

if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-debian" || &term =~ "xterm-xfree86"
  set t_Co=16
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

"================================================================
" Others
"================================================================


