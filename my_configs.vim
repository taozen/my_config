" My customization of vim on top of Amix's ultimate vimrc. 
"   Author: Tao Zheng
"
"   HINT:   Type zR if you don't know how to use folds
"

" Disable mouse moving triggered by touch pad.      {{{
set mouse=          

"}}}
" I don't like a left bar that shows folding, because it's really distracting.      {{{
set foldcolumn=0    

"}}}
" Color scheme.      {{{
"colorscheme evening " Use this under Windows.
colorscheme zellner
set background=dark

"}}}
" Indentation for c/c++.        {{{
" t0 => Indent a function return type declaration.
" g0 => Align scope declarations, e.g. 'public:', with entering block.
" :0 => Indent case lables from switch.
" (0 => Indent within unclosed parentheses.
" l1 => Align with case lable.
" is => Indent C++ base class declarations and constructor initializations.
" c0 => Indent comments.
set cino=t0g0:0(0,W4l1isc0

"}}}
" Disable auto indent and smart indent. I prefer indent by file type.       {{{
set noai 
set nosi

"}}}
" Four-spaces tab, auto expansion.      {{{
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

"}}}
" Fold settings.        {{{
" Quick enablement of syntax-fold.
" zc - close current fold
" zo - open all folds
" zM - close all folds
" zR - open all folds
" In addition, use zf<motion> to create a fold manually.
" Or under marker mode, <range>fo to create a fold.
map <leader>f :set fdm=syntax<cr>
" Keep all folds open when a file is opened

set fdm=syntax
augroup OpenAllFoldsOnFileOpen
    autocmd!
    autocmd BufRead * normal zR
augroup END

"}}}
" ',n' for quick 'set nu'         {{{
map <leader>n :set nu<cr>

"}}}
" Ruby style recommends two-space indent.       {{{
au FileType ruby setl sw=2 sts=2 et

"}}}
" Disable cursor jumping on search.     {{{
set noincsearch

"}}}
" I enjoy a concise status bar.     {{{
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ \ Col:\ %c

"}}}
" Settings for the Minibuffer Explorer (MBE).       {{{
try
    source ~/.vim_runtime/minibufexpl.vim
    let g:miniBufExplBRSplit = 1
    let g:miniBufExplVSplit = 25
    let g:miniBufExplorerDebugLevel = 10
    let g:miniBufExplModSelTarget = 1
    let g:miniBufExplorerMoreThanOne = 2
    let g:miniBufExplModSelTarget = 0
    let g:miniBufExplUseSingleClick = 1
    let g:miniBufExplMapWindowNavVim = 1
    let g:miniBufExplMaxSize = 0
    let g:miniBufExplSplitBelow=1
    let g:bufExplorerSortBy = "name"
    let g:miniBufExplorerHideWhenDiff = 1

    autocmd BufRead,BufNew :call UMiniBufExplorer

    map <leader>u :MBEToggle<cr>
    map <leader>ba :%bd!<bar>q!<cr>
catch
endtry

"}}}
" Auto filetype for Expect scripts.     {{{
augroup exp
    au!
    au BufRead,BufNew *.exp setl autoindent smartindent

    " Note that ^H is actually (ctrl-v ctrl-h) under insertion mode.
    au BufRead,BufNew *.exp inoremap # X#
augroup END

" Matchit for fast locating of the end/begining of a code block.
runtime macros/matchit.vim

"}}}

" vim:ft=vim:fdm=marker
