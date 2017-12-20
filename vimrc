" 插件管理
" {{{
set nocompatible " Required
filetpye off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Shougo/neocomplete'
Plugin 'bling/vim-airline'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'

call vundle#end()
filetype plugin indent on
" }}}

"一些特殊配置项(非set)
"{{{

"语法高亮
if has("syntax")
  syntax on
endif


"开启类型插件支持(pyflakes)
filetype on
filetype plugin on

if has("autocmd")
  filetype plugin indent on
endif



"配色方案
syntax enable
set background=dark
colorscheme solarized
hi Normal guibg=#000000
"}}}

"大多数SET
"{{{

"禁止生成临时文件
set nobackup
set noswapfile

" 高亮列  hi colorcolumn
autocmd FileType python,c set colorcolumn=76

set nocp        "设置为扩展模式
set hidden
set showtabline=0

set laststatus=2 "显示状态栏

"关于折叠
set foldenable
set foldmethod=marker


" Tab切换成4个空格
set tabstop=4
autocmd FileType  html,javascript,css,yaml set tabstop=2

"Tab转换为空格 公司fix
" set expandtab
autocmd FileType  make set noexpandtab

set autoindent


" 选中的文本高亮
set hlsearch

" encoding
set encoding=utf-8
set termencoding=utf-8
if has('win32')
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" language messages zh_cn.utf-8


"显示行号
set number
"显示光标当前位置
set ruler

"高亮显示当前行/列
set cursorline
set cursorcolumn


"设置空格核缩进的提示
set list
set listchars=tab:\|-,trail:=,extends:>,precedes:<


"启动时不显示提示
set shortmess=atIW

"实时搜索功能配置
set incsearch
set ignorecase

"vim 自身命令行模式智能补全
set wildmenu

"}}}

"一些MAP 和插件配置
"{{{
"
let g:neocomplete#enable_at_startup = 1

map gb :TagbarToggle<CR>
let g:tagbar_width = 30

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


"配置NERDTREE
let NERDChristmasTree=1 "装饰窗体!
let NERDTreeHighlightCursorline=1 "高亮选中行
let NERDTreeQuitOnOpen=1 "打开文件后自动关闭树
let NERDTreeWinPos='left'  "显示的窗体位置
nnoremap gt :NERDTreeToggle<cr>  "设置映射键位
autocmd vimenter * NERDTree


imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)


nnoremap to :tabnew<CR>
nnoremap tn :tabnext<CR>
nnoremap tp :tabprev<CR>

autocmd FileType python nnoremap gd :call append(line("."),'__import__("pdb").set_trace()')<CR>
autocmd FileType python nnoremap gp :call append(line("."),'__import__("pprint").pprint(None)')<CR>