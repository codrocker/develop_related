" 让vim可以接受鼠标响应，点击，拖拽都可以
set mouse=a

"一般设置.
"set nocompatible "VIM而不是VI
set history=50 "历史记录50条
set fenc=utf-8 "设置默认语言为8位unicode
"man Q gq "屏蔽Q, 以免进入Ex模式
filetype on "打开文件类型检测

"
""颜色设置.
colorscheme delek "主题
"colorscheme evening "主题
syntax on "语法高亮
set hls " 查找文本高亮

"界面设置.
set ruler "显示当前位置
set number "显示行号
""set nonumber "不显示行号

"格式设置.
set autoindent "自动缩进
set smartindent "智能缩进
set cindent "C缩进
set tabstop=4 "硬TAB
set softtabstop=4 "软TAB
set shiftwidth=4 "缩进空格数
set expandtab "空格替换TAB
"set smarttab "智能TAB
"
set showmatch "显示匹配
"set matchtime=5 "1/10秒延迟
"set hlsearch "高亮搜索
"set incsearch "搜索中匹配
set tags=tags; "ctags
set autochdir "ctags

""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
"开关tag窗口 快捷键F8
nnoremap <silent> <F8> :TlistToggle<CR>

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_Use_SingleClick = 1          "单击跳转到定义
let Tlist_Auto_Open = 1                "自动开启符号列表

"NERDTree快捷键
map <C-n> :NERDTreeToggle<CR>
" NERDTree.vim
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=25
let g:NERDTreeShowLineNumbers=1
let g:neocomplcache_enable_at_startup = 1 
let g:NERDChristmasTree=1
let g:NERDTreeMouseMode=3
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
