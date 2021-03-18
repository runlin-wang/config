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
" Plug
" ==================================================

" vim-plug config

call plug#begin('~/.config/nvim/plugged')
Plug 'romainl/Apprentice'                               " 主题
Plug 'morhetz/gruvbox'                                  " 主题
Plug 'ajmwagar/vim-deus'                                " colorscheme
Plug 'vim-airline/vim-airline'                          " 状态栏
Plug 'vim-airline/vim-airline-themes'                   " 状态栏主题
Plug 'derekwyatt/vim-fswitch'                           " 接口与实现快速切换
Plug 'scrooloose/nerdcommenter'                         " 快速开关注释插件
Plug 'ryanoasis/vim-devicons'                           " 文件图标
Plug 'hotoo/pangu.vim'                                  " pangu 中文排版规范化
Plug 'vimwiki/vimwiki'                                  " vimwiki
Plug 'junegunn/vim-easy-align'                          " 文本对齐
Plug 'ianva/vim-youdao-translater'                      " 有道翻译
Plug 'preservim/tagbar'                                 " 大纲查看
Plug 'mhinz/vim-startify'                               " vim 开始屏幕
Plug 'Lokaltog/vim-easymotion'                          " 快速移动

" nerdtree
Plug 'scrooloose/nerdtree',{'on': 'NERDTreeToggle'}                     " 工程管理
Plug 'Xuyuanp/nerdtree-git-plugin',{'on': 'NERDTreeToggle'}             " nerdtree-git-plugin
Plug 'tiagofumo/vim-nerdtree-syntax-highlight',{'on': 'NERDTreeToggle'} " nerdtree 高亮

" Git 
Plug 'airblade/vim-gitgutter'                           " 在 vim 里使用 git 命令
Plug 'tpope/vim-fugitive'                               " vim 里显示文件变动
Plug 'junegunn/gv.vim'                                  " git commit Brower

" markdown 预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'plasticboy/vim-markdown',{'for': 'markdown'}      " markdown 高亮

" Golang Plug
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }

" Code
Plug 'neoclide/coc.nvim', {'branch': 'release'}         " 自动补全
Plug 'SirVer/ultisnips'                                 " 代码片段
Plug 'honza/vim-snippets'                               " 片段库
Plug 'jiangmiao/auto-pairs'                             " 成对输入
Plug 'ctrlpvim/ctrlp.vim'                               " 文件模糊搜索
Plug 'Yggdroot/indentLine'                              " 缩进显示

" TODO: 中英切换

call plug#end()

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

" 禁用鼠标
set mouse=

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
" colorscheme apprentice
" colorscheme gruvbox
colorscheme deus

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
if !isdirectory("$HOME/.config/nvim/files/backup/") || !isdirectory("$HOME/.config/nvim/files/undo/") || !isdirectory("$HOME/.config/nvim/files/swap/")
    silent !mkdir -p ~/.config/nvim/files/{ backup, swap, undo }
endif

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

" 开启文件类型监测
filetype off
filetype plugin on
filetype plugin indent on

" ==================================================
" map
" ==================================================

" nnoremap 

" 定义快捷键到行首和行尾
nnoremap H 0
nnoremap L $

noremap ; :
noremap : ;

cnoremap <C-n> <down>
cnoremap <C-p> <up>

" nnoremap <CR> a<CR><Esc>k$
nnoremap <C-CR> o<Esc>k
nnoremap <S-CR> O<Esc>j

" 括号补全
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap < <><Esc>i
" inoremap " ""<Esc>i
" inoremap ,, <Esc>la

" Insert Mode Cursor Movement
inoremap <C-a> <Home>
inoremap <C-e> <End>
" inoremap <C-p> <Up>
" inoremap <C-n> <Down>
" inoremap <C-b> <Left>
" inoremap <C-f> <Right>

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
vnoremap \s :s//g<Left><Left>

" buffer 切换快捷键
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>

" ==================================================
" Leader
" ==================================================

" 定义快捷键的前缀，即<Leader>
let g:mapleader="\<space>"

" Open the vimrc file anytime
nnoremap <Leader>rc :e $MYVIMRC<CR>

" source $MYVIMRC
nnoremap <Leader>R :source $MYVIMRC<CR>

" 去除搜索高亮显示
nnoremap <Leader><CR> :nohlsearch<CR>

" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y

" 设置快捷键将系统剪贴板内容粘贴至 vim
nnoremap <Leader>p "+p

" 定义快捷键关闭当前窗口
nnoremap <Leader>q :q<CR>

" 定义快捷键关闭当前所有窗口
nnoremap <Leader>e :qa<CR>

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

" split window
nnoremap <Leader>- :split<CR>
nnoremap <Leader>\ :vsplit<CR>

" modify resize 
nnoremap <Leader>vr :vertical resize 
nnoremap <Leader>rs :resize 

" Spelling Check with <Leader>sc
nnoremap <Leader>sc :set spell!<CR>

" set wrap
nnoremap <Leader>sw :set wrap<CR>

" Opening a terminal window
nnoremap <Leader>/ :set splitbelow<CR>:split<CR>:res +10<CR>:term<CR>I

" ==================================================
" function
" ==================================================

func! SpWindow()
    set splitbelow
    :sp
    :res -15
endfunc

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
    " elseif &filetype == 'html'
        " :!open %
    elseif &filetype == 'html'
        silent! exec "!".g:mkdp_browser." % &"
    elseif &filetype == 'markdown'
        :!open %
        " :MarkdownPreview
    elseif &filetype == 'javascript'
        :call SpWindow()
        :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
    elseif &filetype == 'go'
        :call SpWindow()
        :term go run %
    endif
endfunc

" <Leader>r 运行
noremap <Leader>r :call CompileRun()<CR>

" ==================================================
" snippets
" ==================================================

" go snippets
" source ~/.config/nvim/snippets/go.snippets

" Markdown Settings
source ~/.config/nvim/snippets/md-snippets.vim

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
" airline
" ==================================================

let laststatus = 2
let g:airline_powerline_fonts = 1
let g:airline_theme = "dark"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" ==================================================
" airline-theme deus
" ==================================================

set t_Co=256
" set termguicolors

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:deus_termcolors=256
let g:airline_theme='deus'

" ==================================================
" NERDTree
" ==================================================

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

" 使用 NERDTree 插件查看工程文件。
nnoremap <Leader>n :NERDTreeToggle<CR>

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif

" ==================================================
" vim-fswitch
" ==================================================

" 注释加上空格
let g:NERDSpaceDelims=1

" ==================================================
" vim-go
" ==================================================

" au FileType go nnoremap <Leader>r :GoRun<CR>
au FileType go nnoremap <Leader>t :GoTest<CR>
let g:go_fmt_command = "goimports"

" ==================================================
" UltiSnips
" ==================================================

" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<S-tab>"
" 使用 UltiSnipsEdit 命令时垂直分割屏幕
 let g:UltiSnipsEditSplit="vertical"

" ==================================================
" vim-markdown
" ==================================================

" Github风格markdown语法
let g:vim_markdown_no_extensions_in_markdown = 1

" ==================================================
" markdown-preview
" ==================================================

au FileType markdown noremap <Leader>v :MarkdownPreview<CR>
" autocmd BufWritePre *.markdown,*.md,*.text,*.txt,*.wiki,*.cnx call PanGuSpacing()

" ==================================================
" vim-easy-align
" ==================================================

" Start interactive EasyAlign in visual mode (e.g. vipga)
xnoremap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" ==================================================
" vimwiki
" ==================================================

" 1. blog/diary  -- inbox blog and diary
" 2. todo        -- todo list
" 3. study
" 4. vim
let g:vimwiki_list = [{'path': '~/github.com/blog/', 
                     \ 'syntax': 'markdown', 
                     \ 'ext': '.md'}, 
                     \{'path': '~/github.com/blog/todo/', 
                     \ 'syntax': 'markdown', 
                     \ 'ext': '.md'},
                     \{'path': '~/github.com/blog/study/', 
                     \ 'syntax': 'markdown', 
                     \ 'ext': '.md'},
                     \{'path': '~/github.com/blog/vim/', 
                     \ 'syntax': 'markdown', 
                     \ 'ext': '.md'}]

" 设置开关任务代办快捷键
au FileType markdown nnoremap <Leader><CR> :VimwikiToggleListItem<CR>

" 关闭在插入表格时的 Tab 键映射
let g:vimwiki_table_mappings = 0

" 只在根目录使用 vimwiki 格式，其他地方还是使用 vim 的 markdown 处理
let g:vimwiki_global_ext     = 0

" ==================================================
" youdao-translater
" ==================================================

vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
nnoremap <leader>yd :<C-u>Yde<CR>


" ==================================================
" coc.nvim
" ==================================================

" TODO: https://www.bilibili.com/video/BV1Ka4y1E7AM

" ==================================================
" vim-gitgutter
" ==================================================

nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPrevHunk)

" ==================================================
" auto-pairs
" ==================================================

let g:AutoPairsFlyMode = 1
let g:AutoPairsShortcutBackInsert = '<M-b>'

" ==================================================
" ctrlp
" ==================================================

" mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" When invoked without an explicit starting directory, 
" CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'

" ==================================================
" tagbar
" ==================================================

" mac
" let g:tagbar_ctags_bin='/usr/local/Cellar/ctags/5.8_2/bin/ctags' " 设置ctags所在路径
let g:tagbar_ctags_bin='ctags' " 设置ctags所在路径
nnoremap <Leader>tb :TagbarToggle<CR>
let g:tagbar_width=30                                            " 设置tagbar的宽度
autocmd BufReadPost *.cpp,*.c,*.h,*.java call tagbar#autoopen()  " 在某些情况下自动打开tagbar
let g:tagbar_left = 1                                            " 让tagbar在页面左侧显示，默认右边

" ==================================================
" indentLine
" ==================================================

" 显示 markdown 源代码
let g:indentLine_concealcursor = ''

" ==================================================
" 
" ==================================================

