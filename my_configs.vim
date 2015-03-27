set history=700
set foldcolumn=0 "No left bar

colorscheme zellner
set background=dark

" Set indentation for c/c++
" t0 => Indent a function return type declaration.
" g0 => Align scope declarations, e.g. 'public:', with entering block.
" :0 => Indent case lables from switch.
" (0 => Indent within unclosed parentheses.
" l1 => Align with case lable.
" is => Indent C++ base class declarations and constructor initializations.
" c0 => Indent comments.
set cino=t0g0:0(0,W4l1isc0

set noai "Auto indent
set nosi "Smart indent
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

" Ruby style uses two spaces indent.
au FileType ruby setl sw=2 sts=2 et

set noincsearch

set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l/%L\ \ Col:\ %c

"""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplorerDebugLevel = 10
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplMaxSize = 0
let g:miniBufExplSplitBelow=1

let g:bufExplorerSortBy = "name"

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>
map <leader>ba :%bd!<bar>q!<cr>

"Auto filetype detection works well for shell scripts but not
"for expect, so we need the following settings.
augroup exp
    au!
    au BufRead,BufNew *.exp setl autoindent smartindent

    " Note that ^H is actually (ctrl-v ctrl-h) under insertion mode.
    au BufRead,BufNew *.exp inoremap # X#
augroup END

" Matchit for fast locating the end/begining of a code block.
runtime macros/matchit.vim

"if exists("loaded_matchit")
"  if !exists("b:match_words")
"    let b:match_ignorecase = 0
"    let b:match_words =
"\ '\%(\%(\%(^\|[;=]\)\s*\)\@<=\%(class\|module\|while\|begin\|until\|for\|if\|unless\|def\|case\)\|\<do\)\>:' .
"\ '\<\%(else\|elsif\|ensure\|rescue\|when\)\>:\%(^\|[^.]\)\@<=\<end\>'
"  endif
"endif
