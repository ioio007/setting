" $Id$
"
" Maintainer:   Tzeng Yuxio <tzengyuxio(at)gmail(dot)com>
" Last Change:  2013 Apr 18
"
" To use it, copy it to
"     for Unix and OS X: $HOME/.vimrc
"  for MS-DOS and Win32: $HOME\_vimrc or $VIM\_vimrc

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible               " be iMproved

" Configure Bundles
"-----------------------------------------------------------------------

"filetype off
filetype off                   " required!
filetype plugin on

set rtp+=~/.vim/bundle/vundle.vim
" add swift.vim to runtimepath:
" set runtimepath+=~/.vim/syntax/swift.vim
" call vundle#rc()
call vundle#begin()

" let Vundle manage Vundle, required! 
" Bundle 'gmarik/vundle'
Plugin 'VundleVim/Vundle.vim'

" My Bundles here:
" SnipMate 自動補齊，會跟YouCompleteMe衝突
"Bundle 'MarcWeber/vim-addon-mw-utils'
"Bundle 'tomtom/tlib_vim'
"Bundle 'garbas/vim-snipmate'
"" 讓ultisnips跟YouCompleteMe的tab鍵不會打架...但之前不用也不會打架啊...QQ
"Bundle 'ervandew/supertab' 
Plugin 'honza/vim-snippets'
" ultisnips 跟Snipmate一樣的功能，只是需要用到python，但不會跟YouCompleteMe衝
" 突
Plugin 'SirVer/ultisnips'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" The-NERD-tree 不用離開vim就可以打開其他文件
Plugin 'The-NERD-tree'
"let g:NERDTreeWinPos = "right" "將顯示窗口放右邊
" NOTE: <leader> 代表"\"
" NOTE: control+ww 切換視窗
nmap <leader>n :NERDTree<CR> "設置快捷鍵 
let NERDTreeWinSize=30
" tagbar 可以看到程式碼中的函式和變數，方便追蹤
Plugin 'majutsushi/tagbar'
nmap <leader>t :TagbarToggle<CR> "設置快捷鍵
let g:tagbar_ctags_bin = '/usr/local/bin/ctags' "設置ctags程序位置
let g:tagbar_width=26

" vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"" set status line
set laststatus=2
"" enable powerline-fonts
let g:airline_powerline_fonts = 1
"" enable tabline 
" NOTE: :tabe filename 開啟新分頁(buffers)
" :bn 跳下一個buffer
" :bp 跳上一個buffer
" :b n 跳往第n個buffer
" :bd 關掉目前buffer
let g:airline#extensions#tabline#enabled = 1
"" set left separator
let g:airline#extensions#tabline#left_sep = ' '
"" set left separator which are not editting
let g:airline#extensions#tabline#left_alt_sep = '|'
"" show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
"" theme
let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

" YouCompleteMe
" Bundle 'valloric/YouCompleteMe'
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" let g:ycm_confirm_extra_conf = 0
" let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
" let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']

" syntastic 語法檢查
Plugin 'scrooloose/syntastic'
" recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors = ['trimming empty <i>']

" swift.vim
Plugin 'keith/swift.vim'
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
source ~/.vim/syntax/swift.vim " Required!!!

" vim-swift
" Bundle 'toyamarinyon/vim-swift'

" colorscheme vim-material
Plugin 'hzchirs/vim-material'

call vundle#end()             " required!
filetype indent plugin on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" 移除套件：先把.vimrc裡的拿掉後，再執行:BundleClean
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Setting Options 
"-----------------------------------------------------------------------

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

set backspace=indent,eol,start
set tabstop=4
set shiftwidth=4

set nobackup      " do not keep a backup file
set noswapfile
set nowritebackup " Make a backup before overwriting a file.

" Can be overruled by using "\c" or "\C" in the pattern. ex: \/Cfoobar
set ignorecase    " ignore case when searching
set incsearch     " do incremental searching
set hlsearch      " highlight search things

set showmatch     " show matching bracets"
set matchtime=3   " how many tenths of a second to blink (default 5)

set foldmethod=syntax
set foldlevel=99

set switchbuf=usetab,newtab

set fo+=Bm        " make chinese autowrap, 'fo'='formatoptions'


" set guifont=Menlo\ LG\ S\ Regular\ for\ Powerline:h20

" set nohlsearch " 搜尋完不會highlight，也可手動用:noh 關閉

" Colorscheme and GUI
"-----------------------------------------------------------------------

syntax on
if has('gui_running')
  let g:airline_powerline_fonts = 1
  set guifont=Meslo\ LG\ S\ Regular\ for\ Powerline:h20
  let g:airline_theme='solarized'
  set background=light
  " colorscheme solarized
else
  set background=dark
  " colorscheme xoria256
endif
let g:solarized_termcolors=256
" colorscheme solarized
" colorscheme vim-material
"colorscheme dracula

" 標示游標所在位置的線
set cursorline 
" set cursorcolumn " 設定游標所在的行有顏色
hi cursorline cterm=underline ctermbg=NONE

hi LineNr cterm=bold ctermfg=11 ctermbg=NONE
" 設定行號為：粗體，前景色為深灰色，沒有背景色
" hi 為 highlight 指令的縮寫，有同樣效果
" LineNr line number 的顏色設定
" cterm 指的是為 color terminal 的環境做設定，其他還有term(一般terminal，例如
" 透過putty連上的工作環境)、gui
hi CursorLineNr cterm=bold ctermfg=77 ctermbg=NONE
" 設定游標所在的行號為：粗體，前景色為綠色，沒有背景色

set showtabline=2 " always display tab page labels
set number        " show line number
set laststatus=2  " always show the status line
set showcmd       " display incomplete commands
set cmdheight=2   " the height of command bar is 2 lines

"if has('gui_running')
"  autocmd GUIEnter * winpos 0 0 | set lines=999 columns=9999
"  set guifont=Menlo:h12,Consolas:h12:cANSI,Monaco:h12
"  set guioptions-=m "Remove menubar"
"  set guioptions-=T "Remove toolbar"
  " fix the gui menu encoding problem
"  if has("gui_win32")
"    source $VIMRUNTIME/delmenu.vim
"    source $VIMRUNTIME/menu.vim
"  endif
"endif

" Indentation
"-----------------------------------------------------------------------

" indent switches
set autoindent  " ai
"set smartindent " si
"set cindent     " cin - $VIMRUNTIME/indent/c.vim has included this
"set copyindent  " ci  - ci means copyindent, not cindent

" tabstop options
"   default : ts=8 sts=0 sw=8 noet nosta
"-----------------------------------------------------------------------
" ts  | tabstop     | Number of spaces that a <Tab> counts for.
" sts | softtabstop | Number of spaces that a <Tab> counts for <BS>.
" sw  | shiftwidth  | Number of spaces to use for step of (auto)indent.
" et  | expandtab   | Use some spaces to insert a <Tab>.
" sta | smarttab    | <Tab> inserts blanks according to sw, ts, or sts.
" tw  | textwidth

au BufNewFile,BufRead *.json set ft=javascript
au BufNewFile,BufRead *.scss set ft=scss.css
au BufNewFile,BufRead *.sass set ft=sass.css

au FileType vim     setlocal ts=2 et sw=2
au FileType sh      setlocal ts=4 et sw=4 sts=4
au FileType python  setlocal ts=4 et sw=4 sts=4 tw=79 foldmethod=indent
au FileType html    setlocal ts=2 et sw=2 sts=2
au FileType css     setlocal ts=2 et sw=2 sts=2
au FileType javascript setlocal ts=4 noet sw=4 sts=4
au FileType c,cpp,h       setlocal ts=4 et sw=4 sts=4
"au FileType cpp       setlocal ts=4 et sw=4 sts=4
"au FileType h       setlocal ts=4 et sw=4 sts=4



set modeline

" Language and Localization
"-----------------------------------------------------------------------

" locale language
language zh_TW.UTF-8

" vim encoding and file encoding list
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,japan,prc,taiwan,latin1

" file and terminal encoding
set fileencoding=utf-8
set termencoding=utf-8

" Key Mapping
"-----------------------------------------------------------------------

" Don't use ALT keys for menus.
set winaltkeys=no

" Don't use Ex mode, use Q for formatting
map Q gq
" Press ENTER to start typing commands, just like online-game. ;)
map <CR> :

"nmap <CR> :NERDTree<CR> "設置快捷鍵
"vmap <tab> V>

" F1: online help
" F2: insert datetime
" F3: toggle directory tree
" F4: toggle folds
" F5: toggle search results highlight
" F6: toggle line number
" F7: toggle quick format for BBS
" F8: toggle paste mode (no auto indentation while paste)
" noremap <silent> <F2> a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
"noremap <F5>:NERDTree<CR>
"map <F5> :NERDTree<CR>
" noremap <silent> <F4> za
" noremap <silent> <F5> :set hlsearch!<CR>

" Toggle line numbers and fold column for easy copying:
" noremap <silent> <F6> :set nonumber!<CR>:set foldcolumn=0<CR>
" noremap <silent> <F7> :set tw=72<CR>gggqG:set tw=0<CR>

" nnoremap <F8> :set invpaste paste?<CR>
" imap <F8> <C-O>:set invpaste paste?<CR>
" set pastetoggle=<F8>

" inoremap <silent> <F2> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" close buffer, window or tab
" noremap <Leader>cb :bd<CR>
" noremap <Leader>ct :tabclose<CR>
" noremap <Leader>cw <C-W>c

" close all others, but keep only current
" noremap <Leader>ot :tabonly<CR>   " only one tab left
" noremap <Leader>ow <C-W>o         " only one window left

" easy version without keeping cursor position
" vmap <Tab> >gv
" vmap <S-Tab> <gv

" Reference for one control in different mode.
"noremap <C-Tab> <C-W>w
"inoremap <C-Tab> <C-O><C-W>w
"cnoremap <C-Tab> <C-C><C-W>w
"onoremap <C-Tab> <C-C><C-W>w

" Plugin Configurations
"-----------------------------------------------------------------------

" NeoComplCache
let g:neocomplcache_enable_at_startup=1

" Smart mapping for tab completion
"function InsertTabWrapper()
"    let col = col('.') - 1
"    if !col || getline('.')[col - 1] !~ '\k'
"        return "\<tab>"
"    else
"        return "\<c-p>"
"    endif
"endfunction 

