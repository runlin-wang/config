"  __  ____   ____     _____ __  __ ____   ____ 
" |  \/  \ \ / /\ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  \ \ / / | || |\/| | |_) | |    
" | |  | | | |    \ V /  | || |  | |  _ <| |___ 
" |_|  |_| |_|     \_/  |___|_|  |_|_| \_\\____|

" Author: @runlin-wang
                                              
" Auto load for fitst time uses
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ==================================================
" settings
" ==================================================

" 让配置变更立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC

" 开启实时搜索功能
set incsearch

" 搜索时大小写不敏感
set ignorecase

" 关闭兼容模式
set nocompatible

" vim 自身命令行模式智能补全
set wildmenu

" 总是显示状态栏
set laststatus=2

" 显示光标当前位置
set ruler

" 开启行号显示
set number

" 开启相对行号
set relativenumber

" 在底部显示当前键入的指令
set showcmd

" 对应括号高亮
set showmatch

" set cursorcolumn
" 高亮显示搜索结果
set hlsearch

" 禁止折行
set nowrap

" 开启语法高亮功能
syntax enable

" 允许用指定语法高亮配色方案替换默认方案
syntax on

" 自适应不同语言的智能缩进
filetype indent on

" 将制表符扩展为空格
set expandtab

" 设置编辑时制表符占用空格数
set tabstop=4

" 设置格式化时制表符占用空格数
set shiftwidth=4

" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 基于缩进或语法进行代码折叠
"set foldmethod=indent
set foldmethod=syntax

" 配色方案
set background=dark
" colorscheme pablo
" colorscheme molokai

" 启动 vim 时关闭折叠代码
set nofoldenable

" 垂直滚动时，光标距离顶部/底部的位置（单位：行）
set scrolloff=10

" 出错时，不要发出响声
set noerrorbells

" 出错时，发出视觉提示，通常是屏幕闪烁
set visualbell

" 打开文件监视。如果在编辑过程中文件发生外部改变，就会发出提示
set autoread

" 如果文件夹不存在，则新建文件夹
silent !mkdir -p ~/.config/nvim/tmp/{backup, swap, undo}

" 备份文件
set backup
set backupdir   =~/.config/nvim/files/backup/

" 交换文件
set directory   =~/.config/nvim/files/swap//
set updatecount =100

" 撤销文件
set undofile
set undodir     =~/.config/nvim/files/undo/

" viminfo 文件
set viminfo     ='100,n~/.config/nvim/files/info/viminfo

" 离开插入模式
autocmd InsertLeave,WinEnter * set cursorline
" 进入插入模式
autocmd InsertEnter,WinLeave * set nocursorline nohlsearch


" ==================================================
" map
" ==================================================

" 定义快捷键到行首和行尾
nnoremap H 0
nnoremap L $

noremap ; :
noremap : ;

cnoremap <C-n> <down>
cnoremap <C-p> <up>

nnoremap <CR> a<CR><Esc>k$
nnoremap <C-CR> o<Esc>k
nnoremap <S-CR> O<Esc>j

" 括号补全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {}<Esc>i
" inoremap < <><Esc>i
" inoremap " ""<Esc>i
inoremap ,, <Esc>la

" Insert Mode Cursor Movement
inoremap <C-a> <Esc>I

" Command Mode Cursor Movement
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>

" 依次遍历子窗口
nnoremap nw <C-W>w

" Disable the dafault s key
" nnoremap s <nop>

" Call figlet
noremap tx :r!figlet 

" find and replace
noremap \s :%s//g<Left><Left>

" buffer 切换快捷键
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>

" Markdown Settings
source ~/.config/nvim/md-snippets.vim


" ==================================================
" Leader
" ==================================================

" 定义快捷键的前缀，即<Leader>
let g:mapleader="\<space>"

" Open the vimrc file anytime
noremap <Leader>rc :e $MYVIMRC<CR>

" 去除搜索高亮显示
nnoremap <Leader><CR> :nohlsearch<CR>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y

" 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>p "+p

" 定义快捷键关闭当前分割窗口
nnoremap <Leader>q :q<CR>

" 定义快捷键保存当前窗口内容
nnoremap <Leader>w :w<CR>

" 定义快捷键关闭当前 buffer
nnoremap <Leader>d :bd<CR>

" 定义快捷键保存所有窗口内容并退出 vim
nnoremap <Leader>WQ :wa<CR>:q<CR>

" 不做任何保存，直接退出 vim
nnoremap <Leader>Q :qa!<CR>

" 跳转至右方的窗口
nnoremap <Leader>l <C-W>l

" 跳转至左方的窗口
nnoremap <Leader>h <C-W>h

" 跳转至上方的子窗口
nnoremap <Leader>k <C-W>k

" 跳转至下方的子窗口
nnoremap <Leader>j <C-W>j

" 定义快捷键在结对符之间跳转
nnoremap <Leader>M %

" Spelling Check with <Leader>sc
nnoremap <Leader>sc :set spell!<CR>

" set wrap
nnoremap <Leader>sw :set wrap<CR>

" Opening a terminal window
nnoremap <Leader>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>I

func! SpWindow()
    set splitbelow
    :sp
    :res -15
endfunc

" Compile function
func! CompileRun()
    exec "w"
    if &filetype == 'c'
        exec "!g++ % -o %<"
        exec "!time ./%<"
    elseif &filetype == 'cpp'
        :call SpWindow()
        exec "!g++ -std=c++11 % -Wall -o %<"
        :term ./%<
    elseif &filetype == 'java'
        exec "!javac %"
        exec "time java %<"
    elseif &filetype == 'sh'
        :!time bash %
    elseif &filetype == 'python'
        :call SpWindow()
        :term python3 %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        :InstantMarkdownPreview
    elseif &filetype == 'javascript'
        :call SpWindow()
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        :call SpWindow()
        :term go run %
    endif
endfunc


" ==================================================
" Mode Settings
" ==================================================

" 设置插入模式光标为竖线
"let &t_SI.="\e[5 q" "SI = INSERT mode
"let &t_SR.="\e[4 q" "SR = REPLACE mode
"let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

if empty($TMUX)
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SR = "\<Esc>]50;CursorShape=2\x7"
else
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
endif


" ==================================================
" Plug
" ==================================================

" vim-plug config
call plug#begin('~/.vim/plugged')
Plug 'romainl/Apprentice'                               " 主题
Plug 'morhetz/gruvbox'                                  " 主题
Plug 'vim-airline/vim-airline'                          " 状态栏
Plug 'vim-airline/vim-airline-themes'                   " 状态栏主题
Plug 'derekwyatt/vim-fswitch'                           " 接口与实现快速切换
Plug 'scrooloose/nerdcommenter'                         " 快速开关注释插件
Plug 'scrooloose/nerdtree',{'on': 'NERDTreeToggle'}     " 工程管理
" Plug 'fholgado/minibufexpl.vim'                         " 多文档编辑
Plug 'hotoo/pangu.vim'                                  " pangu 中文排版规范化
Plug 'vimwiki/vimwiki'
" Plug 'Lokaltog/vim-easymotion'                          " 快速移动

" markdown 预览
Plug 'suan/vim-instant-markdown',{'for': 'markdown'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'plasticboy/vim-markdown',{'for': 'markdown'}      " markdown 高亮
Plug 'junegunn/vim-easy-align'                          " 文本对齐

" Golang Plug
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }      " vim-go
Plug 'ycm-core/YouCompleteMe'                           " 智能补全
Plug 'SirVer/ultisnips'                                 " 代码片段
Plug 'honza/vim-snippets'                               " 库
" 中英切换
" 浏览器打开 html
call plug#end()


" Plug setting

filetype off
filetype plugin on
filetype plugin indent on

" colorscheme apprentice
colorscheme gruvbox

" airline
let laststatus = 2
let g:airline_powerline_fonts = 1
let g:airline_theme = "dark"
let g:airline#extensions#tabline#enabled = 1

" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32

" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"

" 显示隐藏文件
let NERDTreeShowHidden=1

" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1

" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

" 注释加上空格
let g:NERDSpaceDelims=1

" Plug map

" *.cpp 和 *.h 间切换
" nnoremap <silent> <Leader>sw :FSHere<cr>

" 使用 NERDTree 插件查看工程文件。
nnoremap <Leader><Leader> :NERDTreeToggle<CR>

noremap <Leader>r :call CompileRun()<CR>

" vim-go config
" au FileType go nnoremap <Leader>r :GoRun<CR>
au FileType go nnoremap <Leader>t :GoTest<CR>
let g:go_fmt_command = "goimports"

" YCM settings
let g:ycm_key_list_select_completion = ['', '']
let g:ycm_key_list_previous_completion = ['']
let g:ycm_key_invoke_completion = '<C-Space>'
" 防止YCM和Ultisnips的TAB键冲突，禁止YCM的TAB
" let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']

" UltiSnips setting
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
 let g:UltiSnipsEditSplit="vertical"

"" vim-markdown
" Github风格markdown语法
let g:vim_markdown_no_extensions_in_markdown = 1

" let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

" 打开预览
" au FileType markdown nnoremap <Leader>r :InstantMarkdownPreview<CR>

" 指定浏览器路径
let g:instant_markdown_browser = "chrome.exe"

autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:vimwiki_list = [{'path': '~/github.com/blog/wiki/', 'syntax': 'markdown', 'ext': '.md'}]


