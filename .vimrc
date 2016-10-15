set encoding=utf-8
scriptencoding utf-8
syntax on
set tabstop=4 "画面上でタブが占める幅
set autoindent
set shiftwidth=4 "自動インデントでずれる幅
set smartindent
set number
set title
set showmatch
set cursorline
set incsearch
set autoread
set showcmd

"括弧の補完
inoremap {<Enter> {}<Left><CR><BS><ESC><S-o>
inoremap ( ()<ESC>i
"inoremap () ()
inoremap [ []<ESC>i
inoremap < <><ESC>i

"挿入モードでもhjklでカーソル移動
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

"行の両端への移動
nnoremap <S-h> ^
nnoremap <S-l> $

"コマンドモードでもEnterキーで改行挿入
nnoremap <CR> A<CR><ESC>
