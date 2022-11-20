" 基础配置
syntax on  "语法高亮
filetype plugin indent on       "开启文件检测、插件、缩进
set nu!  "显示行号
set relativenumber  "显示相对行号
set wrap
set ruler
set showcmd  "设置右下角显示输入的指令
set encoding=utf-8 "设置编码
"set autoindent "设置自动按照上一行缩进
"set smartindent "设置智能缩进
set incsearch
set showmatch "设置括号匹配
set mouse=r "设置鼠标点击
set backspace=indent,eol,start
set tabstop=4 "表示一个Tab键显示出来多少个空格的长度，默认是8，这里设置为4
set softtabstop=4 "表示在编辑模式下按退格键时候退回缩进的长度，设置为4
set shiftwidth=4 "表示每一级缩进的长度，一般设置成和softtabstop长度一样
set noexpandtab "当设置成expantab时表示缩进用空格来表示，noexpandtab则用制表符表示一个缩进


" 括号匹配
imap ( ()<ESC>i
imap () ()<ESC>a

imap [ []<ESC>i
imap [] []<ESC>a

imap {<SPACE> {<SPACE><SPACE>};<ESC><LEFT><LEFT>i
imap {; {<CR><CR>};<ESC>jddkkddkA
imap { {}<ESC>i<CR><CR><ESC>kA<TAB><RIGHT><RIGHT>
imap {} {}<ESC>a

imap < <><ESC>i
imap <<SPACE> <<ESC><RIGHT>r<SPACE>a
imap << <<<ESC><RIGHT>r<SPACE>a<BACKSPACE>
imap <= <=<ESC>a
imap <> <><ESC>a

imap "" ""<ESC>i
imap '' ''<ESC>i


"插件配置
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" " Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' |
Plug 'honza/vim-snippets'
" On-demand loading
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'preservim/nerdtree',     "文件管理插件
Plug 'airblade/vim-rooter',    "工作目录导航插件，配合nerdTree使用
Plug 'neoclide/coc.nvim',  {'branch': 'release'}   "语法补全插件
Plug 'rust-lang/rust.vim', "rust 语法补全插件
Plug 'ybian/smartim', "输入法自动适应"
call plug#end()

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:rooter_patterns = ['.git', 'Makefile', '*.sln', 'build/env.sh']

"rust source code
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

" 指定 smartim插件切换的输入法为mac的英文输入法
let g:smartim_default = 'com.apple.keylayout.ABC'
