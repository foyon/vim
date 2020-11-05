" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2002 Sep 19
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
"set tags=~/dev/tags
"set tags=/home/xiemingqiang/mobile/tags
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
syntax on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set shiftwidth=4

set nobackup		" do not keep a backup file, use versions instead
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
"set cul
"set cuc
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set ts=4
set tabstop=4
set expandtab
set foldmethod=marker
"set cc=81
set hlsearch


"au BufRead,BufNewFile *.* match Underlined /.\%81v/
"set fileencodings=ucs-bom,utf-8,cp936
"set fileencodings=ucs-bom,utf-8,GB18030,gbk
"set fileencoding=cp936
"set encoding=cp936 
"set fileencoding=utf-8
"set fileencodings=utf-8,ucs-bom,cp93
"set fileencoding=utf-8
"set encoding=cp936


"set fileencodings=ucs-bom,utf-8,GB18030,gbk
"set fileencodings=utf-8,ucs-bom,utf-8,GB18030,gbk
" set fileencoding=cp936
"set fileencoding=utf-8
"set encoding=cp936
"set encoding=utf-8
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

set fencs=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
"if &t_co > 2 || has("gui_running")
"syntax on
" set hlsearch
"endif

"syntax on
" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    execute pathogen#infect()
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal g`\"" |
                    \ endif

    augroup END

else

"set autoindent		" always set autoindenting on

endif " has("autocmd")

set nu

colorscheme desert
"colorscheme molokai
"let g:molokai_original = 1
"let g:rehash256 = 1
"set shortmess=atI 
"let g:indent_guides_auto_colors = 0

"ctags
"set tags+=/home/fanhy/jjmweb/tags
"set tags+=/home/fanhy/jjserver/tags
"set tags+=/home/fanhy/PHPCode/tags
set autochdir
"language messages zh_CN.utf-8

set smartindent
"set cindent
"set cc=81

"set cul
"set cuc
"set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%Y-%m-%d\ \%H:%M:%S\")}
set laststatus=2 
"注释引入
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java,*.py,*.php,*.lua,*.go exec ":call ST()"
""定义函数SetTitle，自动插入文件头 
func ST()
    "如果文件类型为.sh文件 
    if &filetype == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."),   "# @File:         ".expand("%"))
        call append(line(".")+1, "# @Aim:          "  )
        call append(line(".")+2, "# @Author:       foyon")
        call append(line(".")+3, "# @Created Time: ".strftime("%Y-%m-%d"))
        call append(line(".")+4, "")

    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*- coding: utf-8 -*-")
        call append(line(".")+1, "#Purpose: ")
        call append(line(".")+2, "#Auhtor: foyon")
        call append(line(".")+3, "#Create: ".strftime("%Y-%m-%d"))
        call append(line(".")+4, "")
    elseif &filetype == 'mkd'
        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
    elseif &filetype == 'lua'
        call setline(1, "--[[")
        call append(line("."),   "  -- @File:         ".expand("%"))
        call append(line(".")+1,   "  -- @Aim:          "  )
        call append(line(".")+2, "  -- @Author:       foyon")
        call append(line(".")+3, "  -- @Created Time: ".strftime("%Y-%m-%d"))
        call append(line(".")+4, "]]--")
        call append(line(".")+5, "")
    elseif &filetype == 'php'
        call setline(1,"<?php")
        call append(line(".") ,"/**")
        call append(line(".")+1, "* @File:          ".expand("%"))
        call append(line(".")+2, "* @Aim:           ")
        call append(line(".")+3, "* @Author:        foyon")
        call append(line(".")+4, "* @Created Time:  ".strftime("%Y-%m-%d"))
        call append(line(".")+5, "*/")
        call append(line(".")+6, "")
    endif
    if &filetype == 'go'
        call setline(1,"/**")
        call append(line("."),   "* @File:          ".expand("%"))
        call append(line(".")+1, "* @Aim:           ")
        call append(line(".")+2, "* @Author:        foyon")
        call append(line(".")+3, "* @Created Time:  ".strftime("%Y-%m-%d"))
        call append(line(".")+4, "*/")
        call append(line(".")+5, "package _")
        call append(line(".")+6, "import ()")
    endif

    if &filetype == 'cpp'
        call append(line(".")+6, "#include<iostream>")
        call append(line(".")+7, "using namespace std;")
        call append(line(".")+8, "")
    endif
    if &filetype == 'c'
        call append(line(".")+6, "#include<stdio.h>")
        call append(line(".")+7, "")
    endif
    if &filetype == 'java'
        call append(line(".")+6,"public class ".expand("%"))
        call append(line(".")+7,"")
    endif
    "新建文件后，自动定位到文件末尾
endfunc
autocmd BufNewFile * normal G


let Tlist_Sort_Type = "name"    " 按照名称排序  
let Tlist_Use_Right_Window = 1  " 在右侧显示窗口  
let Tlist_Compart_Format = 1    " 压缩方式  
let Tlist_Exist_OnlyWindow = 1  " 如果只有一个buffer，kill窗口也kill掉buffer  

"add By foyon
 autocmd vimenter * if !argc() | NERDTree | endif
 " 只剩 NERDTree时自动关闭
 autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
 "map <F1> :NERDTree<CR>
 map <F1> :NERDTreeToggle<CR>
 map <F3> :Autoformat<CR>
 "let NERDTreeDirArrows = 2 

"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -g -o %<"
	exec "!gdb ./%<"
endfunc


"代码格式优化化

map <F6> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc


call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'dgryski/vim-godef'
Plug 'Chiel92/vim-autoformat'
call plug#end()
let g:go_version_warning = 0
let g:godef_same_file_in_same_window=1
let g:godef_split=2


"let g:user_emmet_install_global = 0
"autocmd FileType vue EmmetInstall
"autocmd FileType vue syntax sync fromstart
"autocmd FileType js syntax sync fromstart








