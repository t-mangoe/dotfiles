if !&compatible
  set nocompatible
endif

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

" reset augroup
augroup MyAutoCmd
  autocmd!
augroup END

" dein settings {{{
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.vim') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir .",". &runtimepath
" プラグイン読み込み＆キャッシュ作成
let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/.dein.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [$MYVIMRC, s:toml_file])
  call dein#load_toml(s:toml_file)
  call dein#end()
  call dein#save_state()
endif
" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif
" }}}
