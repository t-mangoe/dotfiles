if !&compatible
  set nocompatible
endif

filetype plugin indent on
set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp "読み込み時の文字コードの設定
set fileformats=unix,dos,mac "改行コードの自動判別。左側が優先
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
"set hlsearch "検索結果をハイライト
"ESCキー2度押しで、ハイライトの切り替え
""nnoremap <silent><ESC><ESC> :<C-u>set nohlsearch!<CR>
set wildmenu "コマンドモードの補完
set history=5000 "保存するコマンド履歴の数

"括弧の補完
"inoremap {<Enter> {}<Left><CR><BS><ESC><S-o>
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

"Yキーでカーソルから行末までコピー
nnoremap Y y$

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
"<C-e>にNERDTreeを設定
nnoremap <silent><C-e> :NERDTreeToggle<CR>

augroup fileTypeIndent
    autocmd!
	"autocmd bufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2
    autocmd bufNewFile,BufRead *.cpp setfiletype cpp
    autocmd bufNewFile,BufRead *.rb setfiletype ruby
augroup END

syntax on
set laststatus=2 "ステータスバーの表示。lightline用に設定。
"ステータスバーに色が表示されない場合、"export TERM=xterm-256color"のコマンドを叩くと、色がつくかも

" クリップボードからペーストするときの設定。インデントがずれないようにする
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

"unite用の設定
"
nnoremap [unite] <nop>
nmap <space>u [unite]
"入力モードで開始する
let g:unite_enable_start_insert=1
"バッファ一覧
noremap <silent> [unite]b :Unite buffer<CR>
"ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
"最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>

"neocomplete用の設定
"起動時に有効化
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_ignore_case = 1
"大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
"補完候補の一番先頭を選択状態にする
"let g:neocomplete#enable_auto_select = 1
"補完を表示する最小文字数
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#enable_camel_case_completion = 0
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#use_vimproc = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size = 30000000
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns._ = '\h\w*'
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
