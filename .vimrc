if !&compatible
  set nocompatible
endif

set encoding=utf-8
scriptencoding utf-8
set tabstop=4 "画面上でタブが占める幅
set softtabstop=4 "連続した空白を一度で削除
set expandtab "タブが空白になる
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
set ignorecase "検索の際に大文字と小文字の区別をしない
set smartcase "検索の際、大文字の場合は小文字と区別。ignorecaseが有効の場合のみ

"括弧の補完
inoremap {<Enter> {}<Left><CR><BS><ESC><S-o>
inoremap ( ()<ESC>i
"inoremap () ()
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap " ""<Left>

"挿入モードでもhjklでカーソル移動
"inoremap <C-h> <Left>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-l> <Right>
inoremap <C-j> <ESC>

"行の両端への移動
nnoremap <C-h> ^
nnoremap <C-l> $

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

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') && file_name == ''
    autocmd VimEnter * NERDTree ./
endif

augroup fileTypeIndent
    autocmd!
	autocmd bufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
augroup END

syntax on
set laststatus=2 "ステータスバーの表示。lightline用に設定

"unite用の設定
"入力モードで開始する
let g:unite_enable_start_insert=1
"バッファ一覧
noremap <C-P> :Unite buffer<CR>
"ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
"最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
