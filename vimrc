" 插件管理
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'edkolev/tmuxline.vim'
Plug 'FooSoft/vim-argwrap'
Plug 'hotoo/pangu.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'michaeljsmith/vim-indent-object'
Plug 'Raimondi/delimitMate'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'skywind3000/asyncrun.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline-themes'
Plug 'w0rp/ale'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Python Plugins
Plug 'nvie/vim-flake8'
Plug 'zchee/deoplete-jedi'

" Golang Plugins
Plug 'fatih/vim-go'
Plug 'zchee/deoplete-go', { 'do': 'make' }

" Themes
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'

" deoplete on neovim and neocomplete on other

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
else
  Plug 'Shougo/neocomplete'
  let g:neocomplete#enable_at_startup = 1
endif

call plug#end()

" 特殊配置项

" 语法高亮
if has("syntax")
  syntax on
endif

" 开启类型插件支持 (pyflakes)
filetype on
filetype plugin on

if has("autocmd")
  filetype plugin indent on
endif

" GUI 启动时最大化

if has('gui_running') && has('win32')
  au GUIEnter * simalt ~x
endif

" 显示效果配置

" 配色方案
syntax enable
set background=dark
" colorscheme solarized
let g:seoul256_background = 235
colorscheme seoul256
hi Normal guibg=#000000
hi Search cterm=reverse ctermfg=2 guifg=Black guibg=Blue


" 字体设置
set guifont=Source_Code_Pro:h11

" 禁止显示滚动条
set guioptions-=L
set guioptions-=l
set guioptions-=R
set guioptions-=r

" 禁止显示工具条
set guioptions-=T

" SET

" mac 下使用系统剪切板
set clipboard=unnamed

" 禁止生成临时文件
set nobackup
set noswapfile

" 允许使用鼠标
set mouse=a

" 高亮列 hi colorcolumn
autocmd FileType python,c set colorcolumn=80

" 设置不兼容 vi
set nocp
" 允许隐藏被修改过的 buffer
set hidden
set showtabline=2
set noshowmode
" 显示状态栏
set laststatus=2

set showmatch

" 关于折叠
set foldenable
set foldmethod=marker

" Tab 切换成 4 个空格
set tabstop=4
autocmd FileType html,javascript,css,yaml set tabstop=2
set shiftwidth=4
set smarttab

" 以下格式的文件禁止 Tab 转换为空格
autocmd FileType make,go set noexpandtab

set autoindent
set smartindent

set autoread

" 编码设置

" Vim 内部缓冲、菜单、消息的字符编码
set encoding=utf-8
" Vim 终端的编码方式，对 gVim 无效，Console 模式控制代码页
set termencoding=utf-8
" 设置文件编码，按照 fileencodings 的顺序探测文件编码
if has('win32')
    set fileencoding=chinese
else
    set fileencoding=utf-8
endif
set fileencodings=utf-8,ucs-bom,cp936,gb18030,big5,euc-jp,euc-kr,latin1
" 解决 Vim 提示信息乱码
language messages zh_cn.utf-8
" 解决 Vim 菜单乱码，重新载入 menu
" source $VIMRUNTIME/delmenu.vim
" source $VIMRUNTIME/menu.vim

" 显示行号
set number
" 显示光标当前位置
set ruler

set showcmd

" 高亮显示当前行 / 列
set cursorline
" set cursorcolumn 影响 icon 显示

" 选中的文本高亮
set hlsearch

" 设置空格和缩进的提示
set list
set listchars=tab:\|-,trail:=,extends:>,precedes:<
" 编辑 .go 时不显示 tab
autocmd FileType go set nolist

" 启动时不显示提示
set shortmess=atIW

" 实时搜索功能配置
set incsearch
set ignorecase

" Vim 自身命令行模式智能补全
set wildmenu

" 自定义 mapping

" 上下移动行
nnoremap _ ddkkp
nnoremap - ddp

vnoremap _ U
vnoremap - u

nnoremap <silent> bl :ls<CR>
nnoremap <silent> bo :enew<CR>
nnoremap <silent> bn :bnext<CR>
nnoremap <silent> bp :bprevious<CR>
nnoremap <silent> bd :bdelete<CR>

nnoremap J <C-y>
nnoremap K <C-e>

" leader mapping

let mapleader=','

nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

nnoremap <silent> <leader>m :nohlsearch<CR>

nnoremap <leader>w :w<CR>

" Plugins

" Asyncrun

let g:asyncrun_open = 10
nnoremap <leader>cc :cclose<CR>
nnoremap <leader>co :copen 10<CR>

" ArgWrap

nnoremap <silent> <leader>a :ArgWrap<CR>
" 展开 Python 代码时最后一行添加逗号
autocmd FileType python let g:argwrap_tail_comma = 1

" vim-go

let g:go_doc_keywordprg_enabled = 0

" tagbar

map gb :TagbarToggle<CR>
let g:tagbar_width = 50
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_show_linenumers = 1

" gitgutter

nnoremap <leader>hn :GitGutterNextHunk<CR>
nnoremap <leader>hp :GitGutterPrevHunk<CR>
nnoremap <Leader>ha :GitGutterStageHunk<CR>
nnoremap <Leader>hr :GitGutterUndoHunk<CR>

" airline

let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='default'
" 显示 buffer 编号，方便切换
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline_powerline_fonts=1
let g:airline_theme='angr'

autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | Startify | endif

" vim-devicons

let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:DevIconsEnableFolderExtensionPatternMatching = 1

" NERDTree 配置

" 装饰窗体
let NERDChristmasTree=1
" 高亮选中行
let NERDTreeHighlightCursorline=1
" 打开文件后自动关闭树
let NERDTreeQuitOnOpen=1
" 显示的窗体位置
let NERDTreeWinPos='left'
" 显示隐藏文件
let NERDTreeShowHidden=1
" 不显示这些文件
let NERDTreeIgnore=['\.pyc$', 'node_modules']
" 不显示项目树上额外的信息，例如帮助、提示什么的
let NERDTreeMinimalUI=1
" 设置映射键位
nnoremap <silent> gt :NERDTreeToggle<CR>
" 不指定文件启动时自动开启文件树
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" 只剩下 NERDTree 窗口的时候自动关闭 Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" NERDCommenter 配置
" 在注释后加空格
let g:NERDSpaceDelims=1
" 可以注释空行
let g:NERDCommenterEmptyLines=1

" ctrlp 配置

let g:ctrlp_map = 'tg'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc|class|png|jpg|jpeg)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
" 使用最近的 .git 作为工作目录
let g:ctrlp_working_path_mode = 'r'

" pangu.vim 配置

autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" 自定义 iabbrev

iabbrev @@ ganziqim@live.com

" 自定义 autocmd

augroup python_map
    autocmd!
    autocmd FileType python nnoremap gd :call append(line("."),'__import__("pdb").set_trace()')<CR>
    autocmd FileType python nnoremap gp :call append(line("."),'__import__("pprint").pprint(None)')<CR>
augroup END

" 自动补全设置

" 补全完成后自动关闭提示窗口
augroup complete
  autocmd!
  autocmd CompleteDone * pclose
augroup end


" 使用 Tab 键进行补全，来自 https://gist.github.com/chemzqm/287b0e98560e2e0a1491
" Take <tab> for word complete only
" The 'complete' option controls where the keywords are searched (include files, tag files, buffers, and more).
" The 'completeopt' option controls how the completion occurs (for example, whether a menu is shown).

if exists('did_completes_me_loaded') || v:version < 700
  finish
endif
let did_completes_me_loaded = 1

function! s:completes_me(shift_tab)
  let dirs = ["\<c-p>", "\<c-n>"]

  if pumvisible()
    if a:shift_tab
      return dirs[0]
    else
      return dirs[1]
    endif
  endif

  " Figure out whether we should indent.
  let pos = getpos('.')
  let substr = matchstr(strpart(getline(pos[1]), 0, pos[2]-1), "[^ \t]*$")
  if strlen(substr) == 0 | return "\<Tab>" | endif

  if a:shift_tab
    return "\<c-p>"
  else
    return "\<c-n>"
  endif
endfunction

inoremap <expr> <plug>completes_me_forward  <sid>completes_me(0)
inoremap <expr> <plug>completes_me_backward <sid>completes_me(1)

imap <Tab>   <plug>completes_me_forward
imap <S-Tab> <plug>completes_me_backward
