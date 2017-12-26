" 让vim可以接受鼠标响应，点击，拖拽都可以
set mouse=a

" 跳转时，如果单个，就直接跳，否则就显示列表
nmap <c-]> g<c-]>

" 防止插入模式下复制黏贴自动缩进变形
set paste

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
"nnoremap <silent> <F8> :TlistToggle<CR>

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_Show_One_File =  1           "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
let Tlist_Use_SingleClick = 1          "单击跳转到定义
let Tlist_Auto_Open = 0                "自动开启符号列表

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

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: andy")
        call append(line(".")+2, "\# mail: wangshuwei@inke.cn")
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\#########################################################################")
        call append(line(".")+5, "\#!/bin/bash")
        call append(line(".")+6, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: andy")
        call append(line(".")+2, "    > Mail: wangshuwei@inke.cn ")
        call append(line(".")+3, "    > Created Time: ".strftime("%c"))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
        call append(line(".")+9,"")
        call append(line(".")+10,"int main()")
        call append(line(".")+11,"{")
        call append(line(".")+12,"")
        call append(line(".")+13,"\treturn 0;")
        call append(line(".")+14,"}")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
"vundle.vim
"可以管理、安装、卸载你的插件
""""""""""""""""""""""""""""""

"似乎这里是必须的,后面会重新打开
filetype off

"设置运行跟初始化Vundle的路径
set rtp+=~/.vim/bundle/vundle/

"设置插件的安装目录,默认是vundle
"call vundle#begin('~/some/path/here')
"所有的安装插件都要在begin 跟 end
call vundle#begin()


"添加Vundle到Vundle管理列表
Bundle 'gmarik/vundle'

"""""""""""""""""""""""""
"在Github其他用户下的repos, 需要写出”用户名/repos名
"""""""""""""""""""""""""
"方法、变量列表
Bundle 'majutsushi/tagbar'

Bundle 'dgryski/vim-godef'
Bundle 'Blackrush/vim-gocode'
Bundle 'jstemmer/gotags'
"Bundle 'Valloric/YouCompleteMe'

"对应上面的begin
call vundle#end()

"对应上面的filetype off
filetype plugin indent on

"tagbar
"F10触发，设置宽度为30
let g:tagbar_width = 30
"开关tagbar窗口 快捷键F8
nnoremap <silent> <F8> :TagbarToggle<CR>
"开启自动预览(随着光标在标签上的移动，顶部会出现一个实时的预览窗口)
let g:tagbar_autopreview = 1
"关闭排序,即按标签本身在文件中的位置排序
let g:tagbar_sort = 0


let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }
